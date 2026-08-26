import 'package:flutter/material.dart';
import 'package:flostoslista/services/shopping_list_service.dart';
import 'package:flostoslista/models/shopping_item.dart';
import "package:flostoslista/widgets/shopping_item_list.dart";
import "package:flostoslista/widgets/clear_purchased_dialog.dart";

class ListScreen extends StatefulWidget {
  final ShoppingListService shoppingListService;
  const ListScreen({super.key, required this.shoppingListService});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<ShoppingItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = widget.shoppingListService.items;
  }

  Future<void> _addItem(String name) async {
    await widget.shoppingListService.addItem(name);

    if (!mounted) return;

    _controller.clear();
    setState(() {
      _itemsFuture = widget.shoppingListService.items;
    });
  }

  Future<void> _removeItem(String id) async {
    await widget.shoppingListService.removeItem(id);

    if (!mounted) return;

    setState(() {
      _itemsFuture = widget.shoppingListService.items;
    });
  }

  Future<void> _updatePurchased(String id, bool value) async {
    await widget.shoppingListService.updatePurchased(id, value);

    if (!mounted) return;

    setState(() {
      _itemsFuture = widget.shoppingListService.items;
    });
  }

  Future<void> _clearPurchasedItems() async {
    await widget.shoppingListService.clearPurchasedItems();

    if (!mounted) return;

    setState(() {
      _itemsFuture = widget.shoppingListService.items;
    });
  }

  Future<void> _showClearPurchasedConfirmationDialog() async {
    final items = await widget.shoppingListService.items;

    if (!mounted) return;

    if (!items.any((item) => item.isPurchased)) return;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return ClearPurchasedDialog(
          onCancel: () {
            Navigator.of(dialogContext).pop();
          },
          onConfirm: () async {
            final navigator = Navigator.of(dialogContext);
            await _clearPurchasedItems();
            if (!mounted) return;
            navigator.pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ostoslista")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Tervetuloa ostoslistaan!",
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: FutureBuilder<List<ShoppingItem>>(
              future: _itemsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  return ShoppingItemList(
                    items: items,
                    onChanged: _updatePurchased,
                    onDelete: _removeItem,
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Virhe: ${snapshot.error}"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showClearPurchasedConfirmationDialog();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Poista ostetut"),
          ),
          Container(
            alignment: .bottomCenter,
            padding: const .all(6),
            child: TextFormField(
              controller: _controller,
              onFieldSubmitted: (value) {
                _addItem(value);
              },
              decoration: InputDecoration(
                suffixIcon: ElevatedButton(
                  onPressed: () {
                    _addItem(_controller.text);
                  },
                  child: const Text("Lisää"),
                ),
                hintText: "Lisää ostos...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
