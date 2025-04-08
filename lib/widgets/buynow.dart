import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Buynow extends ConsumerWidget {
  const Buynow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Color(0xFF37A99B),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(20), // match container radius
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

          child: Text(
            "Buy now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
