class ShoppingItem {
  ShoppingItem({
    required this.id,
    required this.name,
    this.isPurchased = false,
  });

  final String id;
  final String name;
  bool isPurchased;

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "isPurchased": isPurchased};
  }

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    if (json["id"] is! String ||
        json["name"] is! String ||
        json["isPurchased"] is! bool?) {
      throw Exception("Invalid JSON data for ShoppingItem");
    }

    return ShoppingItem(
      id: json["id"] as String,
      name: json["name"] as String,
      isPurchased: json["isPurchased"] as bool? ?? false,
    );
  }
}
