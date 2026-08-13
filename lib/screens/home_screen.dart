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
        child: ElevatedButton(
          //TÄHÄN VOI LAITTAA COLUMNIN JOS HALUAA USEITA NAPPEJA
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ListScreen(shoppingListService: widget.shoppingListService),
              ),
            );
          },
          child: const Text("Avaa ostoslista"),
        ),
      ),
    );
  }
}
