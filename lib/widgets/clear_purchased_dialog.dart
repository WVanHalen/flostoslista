import "package:flutter/material.dart";

class ClearPurchasedDialog extends StatelessWidget {
  const ClearPurchasedDialog({
    super.key,
    required this.onCancel,
    required this.onConfirm,
  });

  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Vahvista"),
      content: const Text(
        "Haluatko varmasti poistaa kaikki merkityt tuotteet?",
      ),
      actions: <Widget>[
        TextButton(onPressed: onCancel, child: const Text("Peruuta")),
        TextButton(onPressed: onConfirm, child: const Text("Poista")),
      ],
    );
  }
}
