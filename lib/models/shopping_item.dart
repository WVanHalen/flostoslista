class ShoppingItem {
  ShoppingItem({
    required this.id,
    required this.name,
    this.isPurchased = false,
  });

  final String id;
  final String name;
  bool isPurchased;
}
