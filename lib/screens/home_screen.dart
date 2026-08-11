import 'package:flutter/material.dart';
import 'package:flostoslista/models/shopping_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ShoppingItem> items = [
    ShoppingItem(name: "Maito"),
    ShoppingItem(name: "Leipä"),
    ShoppingItem(name: "Munat"),
  ];

  final TextEditingController _controller = TextEditingController();

  void _addItem(String name) {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return;
    setState(() {
      items.add(ShoppingItem(name: trimmedName));
    });
    _controller.clear();
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

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
                        items.removeAt(index);
                      });
                    },
                  ),
                  onChanged: (value) {
                    setState(() {
                      item.isPurchased = value ?? false;
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
