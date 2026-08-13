import "package:flostoslista/models/shopping_item.dart";
import "package:flostoslista/repositories/shopping_list_repository.dart";

class ShoppingListService {
  final ShoppingListRepository _repository;
  ShoppingListService(this._repository);

  Future<List<ShoppingItem>> get items => _repository.getItems();

  Future<void> addItem(String name) {
    return _repository.addItem(name);
  }

  Future<void> removeItem(String id) {
    return _repository.removeItem(id);
  }

  Future<void> updatePurchased(String id, bool value) {
    return _repository.updatePurchased(id, value);
  }
}
