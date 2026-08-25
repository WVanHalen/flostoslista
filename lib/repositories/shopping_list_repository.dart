import '../models/shopping_item.dart';

abstract class ShoppingListRepository {
  Future<List<ShoppingItem>> getItems();
  Future<void> addItem(String name);
  Future<void> removeItem(String id);
  Future<void> updatePurchased(String id, bool value);
  Future<void> clearPurchasedItems();
}
