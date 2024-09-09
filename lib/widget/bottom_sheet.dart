import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../grocery/grocery_details/grocery_controller.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final GroceryController controller = Get.put(GroceryController());

    return Container(
      height: 500,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.itemController,
            decoration: InputDecoration(
              labelText: 'Add items',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  controller.addItem(controller.itemController.text);
                  controller.itemController.clear(); // Clear the text field after adding
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0), // Add some space between the TextField and chips
          Flexible(
            child: Obx(() {
              return SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0, // Space between chips
                  runSpacing: 4.0, // Space between rows of chips
                  children: controller.items.map((item) {
                    return Chip(
                      label: Text(item),
                      onDeleted: () {
                        controller.removeItem(item); // Optional: Remove item logic
                      },
                    );
                  }).toList(),
                ),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close the bottom sheet when Cancel is pressed
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  controller.addItem(controller.itemController.text);
                  controller.itemController.clear(); // Clear the text field after adding
                  Get.back(); // Close the bottom sheet
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
