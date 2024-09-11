// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grocery/routes/app_route.dart';
// import '../../widget/category_item.dart';
// import '../create_grocery/create_grocery_controller.dart';
// import '../grocery_details/grocery_details_screen.dart';
//
// class GroceryScreen extends StatelessWidget {
//   const GroceryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final CreateGroceryController controller = Get.put(CreateGroceryController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Shopping List",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AppRoute.create);
//             },
//             icon: const Icon(Icons.add),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AppRoute.shopping);
//             },
//             icon: const Icon(Icons.more_vert),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Using Obx to dynamically display categories
//
//             CategoryItem(
//               title: "Bakery & Snacks",
//               iconColor: Colors.red,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Bakery"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Fruits & Vegetables",
//               iconColor: Colors.greenAccent,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Fruits & Vegetables"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Milk & Sweets",
//               iconColor: Colors.grey,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Dairy"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Households",
//               iconColor: Colors.yellowAccent,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Households"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Electronics",
//               iconColor: Colors.cyanAccent,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Electronics"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Clothes",
//               iconColor: Colors.black,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Clothes"),
//                   ),
//                 );
//               },
//             ),
//             CategoryItem(
//               title: "Stationary",
//               iconColor: Colors.orangeAccent,
//               onPressed: () {},
//               onNavigate: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GroceryDetailsScreen(categoryTitle: "Stationary"),
//                   ),
//                 );
//               },
//             ),
//             Obx(() {
//               if (controller.categories.isNotEmpty) {
//                 return Column(
//                   children: controller.categories.map((category) {
//                     return CategoryItem(
//                       title: category, // Use the fetched category
//                       iconColor: Colors.blue, // Set a default color or customize per category
//                       onPressed: () {},
//                       onNavigate: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => GroceryDetailsScreen(categoryTitle: category), // Pass the category
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 );
//               } else {
//                 return const Center(child: Text('No categories available'));
//               }
//             }),
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
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/routes/app_route.dart';
import '../../widget/category_item.dart';
import '../create_grocery/create_grocery_controller.dart';
import '../grocery_details/grocery_details_screen.dart';

// class GroceryScreen extends StatelessWidget {
//   const GroceryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final CreateGroceryController controller = Get.put(CreateGroceryController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Shopping List",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AppRoute.create);
//             },
//             icon: const Icon(Icons.add),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AppRoute.shopping);
//             },
//             icon: const Icon(Icons.more_vert),
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Call the method to fetch categories from the database
//           await controller.fetchCategories(); // Ensure you have this method in your controller
//         },
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Static categories (optional)
//               CategoryItem(
//                 title: "Bakery & Snacks",
//                 iconColor: Colors.red,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Bakery"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Fruits & Vegetables",
//                 iconColor: Colors.greenAccent,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Fruits & Vegetables"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Milk & Sweets",
//                 iconColor: Colors.grey,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Dairy"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Households",
//                 iconColor: Colors.yellowAccent,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Households"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Electronics",
//                 iconColor: Colors.cyanAccent,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Electronics"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Clothes",
//                 iconColor: Colors.black,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Clothes"),
//                     ),
//                   );
//                 },
//               ),
//               CategoryItem(
//                 title: "Stationary",
//                 iconColor: Colors.orangeAccent,
//                 onPressed: () {},
//                 onNavigate: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GroceryDetailsScreen(categoryTitle: "Stationary"),
//                     ),
//                   );
//                 },
//               ),
//               Obx(() {
//                 if (controller.categories.isNotEmpty) {
//                   return Column(
//                     children: controller.categories.map((category) {
//                       return CategoryItem(
//                         title: category,
//                         iconColor: Colors.redAccent,
//                         onPressed: () {},
//                         onNavigate: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => GroceryDetailsScreen(categoryTitle: category),
//                             ),
//                           );
//                         },
//                         onLongPress: () {
//                           _showDeleteConfirmation(context, category, controller);
//                         },
//                       );
//                     }).toList(),
//                   );
//                 }
//                 else {
//                   return const Center(child: Text('No categories available'));
//                 }
//               }),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//   void _showDeleteConfirmation(BuildContext context, String category, CreateGroceryController controller) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Category'),
//           content: Text('Are you sure you want to delete the category "$category"?'),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () {
//                 controller.deleteCategory(category); // Call the delete method in the controller
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }






class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateGroceryController controller = Get.put(CreateGroceryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.create);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.shopping);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Call the method to fetch categories from the database
          await controller.fetchCategories(); // Ensure you have this method in your controller
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Static categories (optional)
              CategoryItem(
                title: "Bakery & Snacks",
                iconColor: Colors.red,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Bakery"),
                    ),
                  );
                },
              ),
          CategoryItem(
                title: "Fruits & Vegetables",
                iconColor: Colors.greenAccent,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Fruits & Vegetables"),
                    ),
                  );
                },
              ),
              CategoryItem(
                title: "Milk & Sweets",
                iconColor: Colors.grey,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Dairy"),
                    ),
                  );
                },
              ),
              CategoryItem(
                title: "Households",
                iconColor: Colors.yellowAccent,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Households"),
                    ),
                  );
                },
              ),
              CategoryItem(
                title: "Electronics",
                iconColor: Colors.cyanAccent,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Electronics"),
                    ),
                  );
                },
              ),
              CategoryItem(
                title: "Clothes",
                iconColor: Colors.black,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Clothes"),
                    ),
                  );
                },
              ),
              CategoryItem(
                title: "Stationary",
                iconColor: Colors.orangeAccent,
                onPressed: () {},
                onNavigate: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryDetailsScreen(categoryTitle: "Stationary"),
                    ),
                  );
                },
              ),

              Obx(() {
                if (controller.categories.isNotEmpty) {
                  return Column(
                    children: controller.categories.entries.map((entry) {
                      return CategoryItem(
                        title: entry.key,
                        iconColor: entry.value, // Use the color associated with the category
                        onPressed: () {},
                        onNavigate: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GroceryDetailsScreen(categoryTitle: entry.key),
                            ),
                          );
                        },
                        onLongPress: () {
                          _showDeleteConfirmation(context, entry.key, controller);
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Add more categories')),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String category, CreateGroceryController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Category'),
          content: Text('Are you sure you want to delete the category "$category"?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                controller.deleteCategory(category); // Call the delete method in the controller
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
