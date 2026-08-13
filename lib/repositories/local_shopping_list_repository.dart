import '../models/shopping_item.dart';
import 'shopping_list_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalShoppingListRepository implements ShoppingListRepository {
  LocalShoppingListRepository(this._prefs) {
    _loadItems();
  }

  static const String _shoppingItemsKey = "shopping_items";
  final SharedPreferences _prefs;
  final List<ShoppingItem> _items = [];

  void _defaultItems() {
    _items.clear();
    _items.addAll([
      ShoppingItem(name: "Maito", id: "1"),
      ShoppingItem(name: "Leipä", id: "2"),
      ShoppingItem(name: "Munat", id: "3"),
    ]);
  }

  void _loadItems() {
    try {
      final itemsJson = _prefs.getString(_shoppingItemsKey);
      if (itemsJson != null) {
        final List<dynamic> itemsList = jsonDecode(itemsJson);
        _items.clear();
        _items.addAll(itemsList.map((item) => ShoppingItem.fromJson(item)));
      } else {
        _defaultItems();
      }
    } catch (e) {
      _defaultItems();
    }
  }

  Future<void> _saveItems() {
    final itemsJson = jsonEncode(_items.map((item) => item.toJson()).toList());
    return _prefs.setString(_shoppingItemsKey, itemsJson);
  }

  @override
  Future<List<ShoppingItem>> getItems() {
    return Future.value(List.unmodifiable(_items));
  }

  @override
  Future<void> addItem(String name) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return;
    _items.add(ShoppingItem(name: trimmedName, id: DateTime.now().toString()));
    await _saveItems();
  }

  @override
  Future<void> removeItem(String id) async {
    _items.removeWhere((item) => item.id == id);
    await _saveItems();
  }

  @override
  Future<void> updatePurchased(String id, bool value) async {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].isPurchased = value;
      await _saveItems();
    }
  }
}
