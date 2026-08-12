import '../models/shopping_item.dart';
import 'shopping_list_repository.dart';

class LocalShoppingListRepository implements ShoppingListRepository {
  final List<ShoppingItem> _items = [
    ShoppingItem(name: "Maito", id: "1"),
    ShoppingItem(name: "Leipä", id: "2"),
    ShoppingItem(name: "Munat", id: "3"),
  ];

  @override
  List<ShoppingItem> getItems() {
    return List.unmodifiable(_items);
  }

  @override
  void addItem(String name) {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return;
    _items.add(ShoppingItem(name: trimmedName, id: DateTime.now().toString()));
  }

  @override
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  @override
  void updatePurchased(String id, bool value) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].isPurchased = value;
    }
  }
}
