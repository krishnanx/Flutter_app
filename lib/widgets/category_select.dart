import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  int selectedIndex = 0; // Track selected button index

  final List<String> category = ["electronics", "jewelery", "men's clothing"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align to the left
      children: List.generate(category.length, (index) {
        bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(right: 7.1),
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category[index],
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
