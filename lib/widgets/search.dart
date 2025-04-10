import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  final String? placeholder;
  final bool? icon;
  final TextEditingController controller; // Add a controller for text input

  const Search({
    super.key,
    this.icon = true,
    this.placeholder = 'search',
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          icon != null && icon == true
              ? SvgPicture.asset('assets/icons/Search.svg', height: 40)
              : SizedBox(width: 15),
          Expanded(
            child: TextField(
              controller:
                  controller, // Use the controller to capture text input
              decoration: InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
                isDense: true,
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
