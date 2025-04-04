import 'package:flutter/material.dart';

class FeatureCards extends StatelessWidget {
  final String title;
  const FeatureCards({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 264,
      height: 172,
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
