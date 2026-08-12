import '../models/shopping_item.dart';

abstract class ShoppingListRepository {
  List<ShoppingItem> getItems();
  void addItem(String name);
  void removeItem(String id);
  void updatePurchased(String id, bool value);
}
