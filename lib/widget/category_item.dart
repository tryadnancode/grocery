import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color iconColor; // Updated to control the icon color
  final VoidCallback onPressed;
  final VoidCallback onNavigate;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconColor, // Use this for the icon color
    required this.onPressed,
    required this.onNavigate,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue, // Background color set to blue
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  color: iconColor, // Use this for the icon color
                  onPressed: onPressed,
                  icon: const Icon(Icons.circle),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, color: Colors.white), // Text color set to white
                ),
              ],
            ),
            IconButton(
              onPressed: onNavigate,
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white, // Icon color for the arrow
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}



