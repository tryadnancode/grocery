// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../grocery_item/grocery_item.dart';
// import '../../repo/database_helper.dart';
//
//
// class CreateGroceryController extends GetxController {
//   var items = <String>[].obs;
//   var selectedColor = Colors.red.obs; // Default color can be set here
//   var itemController = TextEditingController();
//   var categoryController = TextEditingController(); // Add this line
//
//   final DatabaseHelper dbHelper = DatabaseHelper();
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchItems(); // Load items from the database when the controller is initialized
//   }
//
//   void addItem(String item) async {
//     if (item.isNotEmpty) {
//       items.insert(0, item);
//       await dbHelper.insertItem(item,selectedColor.string); // Insert item into the database
//       itemController.clear();
//     }
//   }
//
//   void removeItem(String item) async {
//     items.remove(item);
//     await dbHelper.deleteItem(item); // Remove item from the database
//   }
//
//   void fetchItems() async {
//     List<GroceryItem> storedItems = await dbHelper.fetchItems();
//     items.assignAll(storedItems.map((item) => item.name).toList()); // Ensure `name` is being mapped correctly
//   }
//
//   void setColor(MaterialColor color) {
//     selectedColor.value = color;
//   }
//
//   String getCategory() => categoryController.text;
// }
//
//
//
//
//
//






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../grocery_item/grocery_item.dart';
import '../../repo/database_helper.dart';

class CreateGroceryController extends GetxController {
  var items = <String>[].obs;
  var categories = <String, MaterialColor>{}.obs; // Map of categories to colors
  var selectedColor = Colors.red.obs; // Default color
  var itemController = TextEditingController();
  var categoryController = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchCategories(); // Fetch categories on initialization if needed
  }

  void addItem(String item) async {
    if (item.isNotEmpty) {
      items.insert(0, item);
      await dbHelper.insertItem(item, selectedColor.value.value.toString()); // Convert color to string
      itemController.clear();
    }
  }

  void removeItem(String item) async {
    items.remove(item);
    await dbHelper.deleteItem(item);
  }

  void fetchItems() async {
    List<GroceryItem> storedItems = await dbHelper.fetchItems();
    items.assignAll(storedItems.map((item) => item.name).toList());
  }

  Future<void> fetchCategories() async {
    List<Map<String, dynamic>> fetchedCategories = await dbHelper.fetchCategories(); // Modify fetch method to return a list of maps
    categories.assignAll({
      for (var category in fetchedCategories)
        category['name']: MaterialColor(int.parse(category['color']), {}), // Convert string to MaterialColor
    });
  }

  void setColor(MaterialColor color) {
    selectedColor.value = color;
  }

  void addCategory(String categoryName) async {
    if (categoryName.isNotEmpty) {
      await dbHelper.insertCategory(categoryName, selectedColor.value.value.toString()); // Convert color to string
      categories[categoryName] = selectedColor.value; // Update categories map
      categoryController.clear(); // Clear after adding
    }
  }

  void deleteCategory(String category) async {
    // Remove the category from the list
    categories.remove(category);

    // Delete the category from the database
    await dbHelper.deleteCategory(category); // Implement this method in your DatabaseHelper
  }
}
