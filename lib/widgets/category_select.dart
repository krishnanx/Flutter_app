import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  final void Function(String selectedCategory) onCategorySelected;

  const CategorySelect({super.key, required this.onCategorySelected});

  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  int selectedIndex = 0;

  final List<String> category = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onCategorySelected(category[selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(category.length, (index) {
        bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onCategorySelected(category[index]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.only(right: 7.1),
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
