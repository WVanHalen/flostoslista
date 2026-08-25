import 'package:flutter/material.dart';
import "package:flostoslista/screens/list_screen.dart";
import "package:flostoslista/services/shopping_list_service.dart";

class HomeScreen extends StatefulWidget {
  final ShoppingListService shoppingListService;
  const HomeScreen(this.shoppingListService, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Villkommen!"), centerTitle: true),
      body: Align(
        alignment: Alignment(0, -0.75),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListScreen(
                        shoppingListService: widget.shoppingListService,
                      ),
                    ),
                  );
                },
                child: const Text("Avaa ostoslista"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // Toinen toiminto, esim to-do -lista
                },
                child: const Text("Toinen toiminto"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
