import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  int selectedIndex = 0; // Track selected button index

  final List<String> meals = ["Breakfast", "Lunch", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align to the left
      children: List.generate(meals.length, (index) {
        bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              meals[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}
