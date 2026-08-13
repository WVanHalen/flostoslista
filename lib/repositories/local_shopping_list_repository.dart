import '../models/shopping_item.dart';
import 'shopping_list_repository.dart';

class LocalShoppingListRepository implements ShoppingListRepository {
  final List<ShoppingItem> _items = [
    ShoppingItem(name: "Maito", id: "1"),
    ShoppingItem(name: "Leipä", id: "2"),
    ShoppingItem(name: "Munat", id: "3"),
  ];

  @override
  Future<List<ShoppingItem>> getItems() {
    return Future.value(List.unmodifiable(_items));
  }

  @override
  Future<void> addItem(String name) {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return Future.value();
    _items.add(ShoppingItem(name: trimmedName, id: DateTime.now().toString()));
    return Future.value();
  }

  @override
  Future<void> removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    return Future.value();
  }

  @override
  Future<void> updatePurchased(String id, bool value) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].isPurchased = value;
    }
    return Future.value();
  }
}
