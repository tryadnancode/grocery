// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grocery/widget/color_picker.dart';
// import 'create_grocery_controller.dart';
//
// class CreateGroceryListScreen extends StatelessWidget {
//   const CreateGroceryListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final CreateGroceryController controller =
//         Get.put(CreateGroceryController());
//
//     void _openColorPicker() async {
//       final color = await showDialog<MaterialColor>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Select a Color'),
//               content: CustomColorPicker(
//                 onColorSelected: (selectedColor) {
//                   controller.setColor(selectedColor);
//                   Navigator.of(context).pop();
//                 },
//                 selectedColor: controller.selectedColor.value,
//               ),
//             );
//           });
//     }
//
//     return Scaffold(
//       backgroundColor: Color(0xffcecccc),
//       appBar: AppBar(
//         title: const Text('Add New Grocery'),
//         backgroundColor: Color(0xFFD2EAF1FF),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller.itemController,
//               decoration: InputDecoration(
//                 labelText: 'Add Items',
//                 filled: true,
//                 border: const OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     controller.addItem(controller.itemController.text);
//                     controller.itemController.clear();
//                   },
//                 ),
//               ),
//               onSubmitted: (value) {
//                 controller.addItem(value);
//               },
//             ),
//             const SizedBox(),
//             Flexible(
//               child: Obx(() {
//                 if (controller.items.isNotEmpty) {
//                   return SingleChildScrollView(
//                     child: Wrap(
//                       spacing: 8.0,
//                       runSpacing: 4.0,
//                       children: controller.items.map((item) {
//                         return Chip(
//                           label: Text(item),
//                           backgroundColor: Color(0xFFD2EAF1FF),
//                           deleteIcon: const Icon(Icons.close),
//                           onDeleted: () {
//                             controller.removeItem(item);
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 } else {
//                   return const SizedBox.shrink();
//                 }
//               }),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Add Category',
//                 filled: true,
//                 border: const OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   onPressed: _openColorPicker,
//                   icon: Obx(() => Icon(
//                         Icons.circle,
//                         color: controller.selectedColor.value,
//                       )),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Add Reminder',
//                 filled: true,
//                 suffixIcon: Icon(Icons.notifications),
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: ()  {
//                 // Pass the items back to the previous screen
//                 Navigator.pop(context, controller.items.toList());
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(50, 50), // Set width and height to make it square
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10), // No border radius to make it square
//                 ),
//               ),
//               child: const Text('Save'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(50, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)
//                 )
//               ),
//               child: const Text('Cancel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/widget/color_picker.dart';
import 'create_grocery_controller.dart';

class CreateGroceryListScreen extends StatelessWidget {
  const CreateGroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateGroceryController controller =
    Get.put(CreateGroceryController());

    void _openColorPicker() async {
      final color = await showDialog<MaterialColor>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select a Color'),
              content: CustomColorPicker(
                onColorSelected: (selectedColor) {
                  controller.setColor(selectedColor);
                  Navigator.of(context).pop();
                },
                selectedColor: controller.selectedColor.value,
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Color(0xffcecccc),
      appBar: AppBar(
        title: const Text('Add New Grocery'),
        backgroundColor: Color(0xFFD2EAF1FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.itemController,
              decoration: InputDecoration(
                labelText: 'Add Items',
                filled: true,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.addItem(controller.itemController.text);
                    controller.itemController.clear();
                  },
                ),
              ),
              onSubmitted: (value) {
                controller.addItem(value);
              },
            ),
            const SizedBox(),
            Flexible(
              child: Obx(() {
                if (controller.items.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: controller.items.map((item) {
                        return Chip(
                          label: Text(item),
                          backgroundColor: Color(0xFFD2EAF1FF),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () {
                            controller.removeItem(item);
                          },
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.categoryController,
              decoration: InputDecoration(
                labelText: 'Add Category',
                filled: true,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.addCategory(controller.categoryController.text);
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Reminder',
                filled: true,
                suffixIcon: Icon(Icons.notifications),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Pass the items back to the previous screen
                Navigator.pop(context, controller.items.toList());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
