import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("SVG button tapped!");
        },
        child: SvgPicture.asset(
          'assets/icons/ArrowRight.svg', // make sure this path is correct
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
