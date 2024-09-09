import 'package:flutter/material.dart';

class CustomColorPicker extends StatelessWidget {
  final ValueChanged<MaterialColor> onColorSelected;
  final MaterialColor selectedColor;

  const CustomColorPicker({
    super.key,
    required this.onColorSelected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final List<MaterialColor> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.amber,
      Colors.purple,
      Colors.cyan,
      Colors.deepPurple,
      Colors.indigo,
      Colors.brown,
      Colors.grey,
      Colors.lightGreen,
      Colors.teal,
      Colors.pink,
      Colors.blueGrey,
      Colors.deepOrange,
      Colors.lightBlue,

    ];

    return SizedBox(
      width: 200,
      height: 120,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return GestureDetector(
            onTap: () => onColorSelected(color),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: selectedColor == color
                    ? Border.all(color: Colors.black, width: 2)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
