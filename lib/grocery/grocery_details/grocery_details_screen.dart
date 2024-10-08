// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../widget/bottom_sheet.dart';
// import 'grocery_controller.dart';
//
// class GroceryDetailsScreen extends StatelessWidget {
//   final String categoryTitle;
//   final GroceryController _controller = Get.put(GroceryController());
//   // Accept categoryTitle as a parameter
//   GroceryDetailsScreen({super.key, required this.categoryTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//         actions: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
//                 )
//         ],// Set the AppBar title dynamically
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             color: Colors.blueAccent,
//           ),
//           child: Obx(() {
//             if (_controller.items.isEmpty) {
//               return const Center(child: Text('No items found.'));
//             }
//             return ListView.builder(
//               itemCount: _controller.items.length,
//               itemBuilder: (context, index) {
//                 final item = _controller.items[index];
//                 return ListTile(
//                   title: Text(item),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () { },
//                   ),
//                 );
//               },
//             );
//           }),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//          // Navigator.pushNamed(context, AppRoute.create);
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return const MyBottomSheet(); // Call the bottom sheet widget
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/bottom_sheet.dart';
import 'grocery_controller.dart';

class GroceryDetailsScreen extends StatefulWidget {
  final String categoryTitle;

  // Accept categoryTitle as a parameter
  GroceryDetailsScreen({super.key, required this.categoryTitle});

  @override
  _GroceryDetailsScreenState createState() => _GroceryDetailsScreenState();
}

class _GroceryDetailsScreenState extends State<GroceryDetailsScreen> {
  final GroceryController _controller = Get.put(GroceryController());
  final Set<int> _clickedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueAccent,
          ),
          child: Obx(() {
            if (_controller.items.isEmpty) {
              return const Center(child: Text('No items found.'));
            }
            return ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (context, index) {
                final item = _controller.items[index];
                final isClicked = _clickedItems.contains(index);
                return ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    icon: Icon(isClicked ? Icons.check : Icons.close,
                        color: isClicked ? Colors.green : Colors.red),
                    onPressed: () {
                      setState(() {
                        if (isClicked) {
                          _clickedItems.remove(index);
                        } else {
                          _clickedItems.add(index);
                        }
                      });
                    },
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const MyBottomSheet(); // Call the bottom sheet widget
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
