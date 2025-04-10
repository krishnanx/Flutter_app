import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/screens/signup.dart';
import '../providers/Auth_provider.dart';

class Initialpage extends ConsumerWidget {
  const Initialpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(decoration: const BoxDecoration(color: Color(0xFF40BFB4))),

          // Decorative curves
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: CurvesPainter(),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top bar with time and "Later" text
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Later",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // Spacer to push content down
                  const Spacer(flex: 2),

                  // Main text
                  const Text(
                    "Help your path to health\ngoals with happiness",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),

                  const Spacer(),

                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).toggleAuth();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003C39),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Create account button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Signup()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Progress indicator at bottom
                  Center(
                    child: Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Improved custom painter for the background curves that more accurately matches the original design
class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF2EAFA4)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round;

    final dotPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    // First curve - long flowing S-shape at the top
    final path1 = Path();
    path1.moveTo(0, size.height * 0.05);
    path1.cubicTo(
      size.width * 0.2,
      size.height * 0.02,
      size.width * 0.3,
      size.height * 0.08,
      size.width * 0.4,
      size.height * 0.12,
    );
    path1.cubicTo(
      size.width * 0.5,
      size.height * 0.16,
      size.width * 0.6,
      size.height * 0.14,
      size.width * 0.75,
      size.height * 0.08,
    );
    path1.cubicTo(
      size.width * 0.85,
      size.height * 0.04,
      size.width * 0.95,
      size.height * 0.06,
      size.width,
      size.height * 0.09,
    );
    canvas.drawPath(path1, paint);

    // Second curve - flowing loop that crosses itself
    final path2 = Path();
    path2.moveTo(size.width * 0.1, size.height * 0.2);
    path2.cubicTo(
      size.width * 0.2,
      size.height * 0.18,
      size.width * 0.25,
      size.height * 0.28,
      size.width * 0.4,
      size.height * 0.26,
    );
    path2.cubicTo(
      size.width * 0.55,
      size.height * 0.24,
      size.width * 0.6,
      size.height * 0.3,
      size.width * 0.7,
      size.height * 0.23,
    );
    path2.cubicTo(
      size.width * 0.8,
      size.height * 0.16,
      size.width * 0.9,
      size.height * 0.2,
      size.width,
      size.height * 0.16,
    );
    canvas.drawPath(path2, paint);

    // Third curve - lower flowing line
    final path3 = Path();
    path3.moveTo(0, size.height * 0.35);
    path3.cubicTo(
      size.width * 0.15,
      size.height * 0.32,
      size.width * 0.25,
      size.height * 0.38,
      size.width * 0.4,
      size.height * 0.33,
    );
    path3.cubicTo(
      size.width * 0.55,
      size.height * 0.28,
      size.width * 0.7,
      size.height * 0.35,
      size.width * 0.85,
      size.height * 0.3,
    );
    path3.cubicTo(
      size.width * 0.9,
      size.height * 0.28,
      size.width * 0.95,
      size.height * 0.3,
      size.width,
      size.height * 0.32,
    );
    canvas.drawPath(path3, paint);

    // Random white dots - distribute them more naturally according to the original design
    final dots = [
      Offset(size.width * 0.28, size.height * 0.13),
      Offset(size.width * 0.48, size.height * 0.16),
      Offset(size.width * 0.65, size.height * 0.2),
      Offset(size.width * 0.75, size.height * 0.15),
      Offset(size.width * 0.2, size.height * 0.28),
      Offset(size.width * 0.55, size.height * 0.27),
      Offset(size.width * 0.82, size.height * 0.27),
      Offset(size.width * 0.35, size.height * 0.34),
      Offset(size.width * 0.6, size.height * 0.33),
      Offset(size.width * 0.78, size.height * 0.34),
    ];

    for (var dot in dots) {
      // Vary the dot sizes slightly for more natural look
      double radius = (dot.dy % 10) / 3 + 1.5;
      canvas.drawCircle(dot, radius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
