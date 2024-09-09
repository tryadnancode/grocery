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
  var categories = <String>[].obs;
  var selectedColor = Colors.red.obs;
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
      await dbHelper.insertItem(item, selectedColor.string);
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

  // void fetchCategories() async {
  //   List<String> storedCategories = await dbHelper.fetchCategories(); // Fetch categories
  //   categories.assignAll(storedCategories); // Update the categories list
  // }
  Future<void> fetchCategories() async {
    // Fetch categories from the database and update the observable list
    List<String> fetchedCategories = await dbHelper.fetchCategories(); // Implement this method in your DatabaseHelper
    categories.assignAll(fetchedCategories);
  }
  void setColor(MaterialColor color) {
    selectedColor.value = color;
  }

  void addCategory(String categoryName) async {
    if (categoryName.isNotEmpty) {
      await dbHelper.insertCategory(categoryName);
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
