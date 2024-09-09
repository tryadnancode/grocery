import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../grocery_item/grocery_item.dart';
import '../../repo/database_helper.dart';


class CreateGroceryController extends GetxController {
  var items = <String>[].obs;
  var selectedColor = Colors.red.obs; // Default color can be set here
  var itemController = TextEditingController();
  var categoryController = TextEditingController(); // Add this line

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // Load items from the database when the controller is initialized
  }

  void addItem(String item) async {
    if (item.isNotEmpty) {
      items.insert(0, item);
      await dbHelper.insertItem(item,selectedColor.string); // Insert item into the database
      itemController.clear();
    }
  }

  void removeItem(String item) async {
    items.remove(item);
    await dbHelper.deleteItem(item); // Remove item from the database
  }

  void fetchItems() async {
    List<GroceryItem> storedItems = await dbHelper.fetchItems();
    items.assignAll(storedItems.map((item) => item.name).toList()); // Ensure `name` is being mapped correctly
  }

  void setColor(MaterialColor color) {
    selectedColor.value = color;
  }

  String getCategory() => categoryController.text;
}