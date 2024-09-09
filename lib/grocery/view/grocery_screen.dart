import 'package:flutter/material.dart';
import 'package:grocery/routes/app_route.dart';
import '../../widget/category_item.dart';
import '../grocery_details/grocery_details_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
