import 'package:flutter/material.dart';
import 'package:flutter_task/models/product.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double imageHeightFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Image that shrinks
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: 400 * imageHeightFactor, // max height
                  width: double.infinity,
                  child: Image.network(widget.product.image, fit: BoxFit.fill),
                ),

                // Draggable Scrollable Sheet
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    // shrink image between 1.0 and 0.6 factor
                    setState(() {
                      double shrink = 1.0 - ((notification.extent - 0.5) * 1.5);
                      imageHeightFactor = shrink.clamp(0.7, 1.0);
                    });
                    return true;
                  },
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    minChildSize: 0.6,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Text(
                              "Healthy Taco Salad",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "• 65g carbs\n• 27g proteins\n• 91g fats\n• 120 Kcal",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
