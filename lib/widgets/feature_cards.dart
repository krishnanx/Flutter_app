import 'package:flutter/material.dart';

class FeatureCards extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const FeatureCards({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // You can change this width to make the card smaller/larger
    double cardWidth = 260;
    double aspectRatio = 1;
    double cardHeight = cardWidth / aspectRatio;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Stack(
          children: [
            // Background image
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // Semi-transparent overlay
            Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(150, 0, 0, 0), // ~47% opacity black
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 160,
                  ), // adjust as needed
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
