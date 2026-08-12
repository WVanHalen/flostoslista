import "package:flutter/material.dart";
import "package:flostoslista/screens/home_screen.dart";
import "package:flostoslista/services/shopping_list_service.dart";
import "package:flostoslista/repositories/local_shopping_list_repository.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ShoppingListService _shoppingListService = ShoppingListService(
    LocalShoppingListRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ostoslista",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: HomeScreen(_shoppingListService),
    );
  }
}
