import 'package:flutter/material.dart';
import 'package:flostoslista/services/shopping_list_service.dart';

class ListScreen extends StatefulWidget {
  final ShoppingListService shoppingListService;
  const ListScreen({super.key, required this.shoppingListService});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addItem(String name) {
    setState(() {
      widget.shoppingListService.addItem(name);
      _controller.clear();
    });
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
          Text("Tervetuloa ostoslistaan!", style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView.builder(
              itemCount: widget.shoppingListService.items.length,
              itemBuilder: (context, index) {
                final item = widget.shoppingListService.items[index];

                return CheckboxListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      decoration: item.isPurchased
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: item.isPurchased
                          ? Theme.of(context).disabledColor
                          : null,
                    ),
                  ),
                  value: item.isPurchased,
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.shoppingListService.removeItem(item.id);
                      });
                    },
                  ),
                  onChanged: (value) {
                    setState(() {
                      widget.shoppingListService.updatePurchased(
                        item.id,
                        value ?? false,
                      );
                    });
                  },
                );
              },
            ),
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
