class GroceryItem {
  final int? id; // Nullable ID for SQLite
  final String name;
  final String color;
  final String category;

  GroceryItem({this.id, required this.name, required this.color, required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'category': category
    };
  }

  factory GroceryItem.fromMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: map['id']??'',
      name: map['name']??'',
      color: map['color']??'',
      category: map ['category']??'',
    );
  }
}
