import "package:flutter/material.dart";
import "package:flostoslista/screens/home_screen.dart";
import "package:flostoslista/services/shopping_list_service.dart";
import "package:flostoslista/repositories/local_shopping_list_repository.dart";
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final shoppingListService = ShoppingListService(
    LocalShoppingListRepository(prefs),
  );
  runApp(MyApp(shoppingListService: shoppingListService));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.shoppingListService});

  final ShoppingListService shoppingListService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ostoslista",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: HomeScreen(shoppingListService),
    );
  }
}
