// next_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onTap; // 🔸 Add this

  const NextButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/icons/ArrowRight.svg',
        width: 24,
        height: 24,
      ),
    );
  }
}
