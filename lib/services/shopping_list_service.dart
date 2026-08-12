import "package:flostoslista/models/shopping_item.dart";
import "package:flostoslista/repositories/shopping_list_repository.dart";

class ShoppingListService {
  final ShoppingListRepository _repository;
  ShoppingListService(this._repository);

  List<ShoppingItem> get items => _repository.getItems();

  void addItem(String name) {
    _repository.addItem(name);
  }

  void removeItem(String id) {
    _repository.removeItem(id);
  }

  void updatePurchased(String id, bool value) {
    _repository.updatePurchased(id, value);
  }
}
