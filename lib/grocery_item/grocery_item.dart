class GroceryItem {
  final int? id; // Nullable ID for SQLite
  final String name;
  final String color;

  GroceryItem({this.id, required this.name, required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory GroceryItem.fromMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: map['id'],
      name: map['name'],
      color: map['color'],
    );
  }
}
