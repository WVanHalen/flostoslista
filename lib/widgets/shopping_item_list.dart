import 'package:flutter/material.dart';
import "package:flostoslista/models/shopping_item.dart";
import "./shopping_item_tile.dart";

class ShoppingItemList extends StatelessWidget {
  const ShoppingItemList({
    super.key,
    required this.items,
    required this.onChanged,
    required this.onDelete,
  });

  final List<ShoppingItem> items;
  final void Function(String, bool) onChanged;
  final ValueChanged<String> onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return ShoppingItemTile(
          item: item,
          onChanged: (value) {
            onChanged(item.id, value ?? false);
          },
          onDelete: onDelete,
        );
      },
    );
  }
}
