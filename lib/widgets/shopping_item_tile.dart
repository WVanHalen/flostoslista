import 'package:flutter/material.dart';
import 'package:flostoslista/models/shopping_item.dart';

class ShoppingItemTile extends StatelessWidget {
  const ShoppingItemTile({
    super.key,
    required this.item,
    required this.onChanged,
    required this.onDelete,
  });

  final ShoppingItem item;
  final ValueChanged<bool?> onChanged;
  final ValueChanged<String> onDelete;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        item.name,
        style: TextStyle(
          decoration: item.isPurchased
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: item.isPurchased ? Theme.of(context).disabledColor : null,
        ),
      ),
      value: item.isPurchased,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      secondary: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          onDelete(item.id);
        },
      ),
    );
  }
}
