import 'package:flutter/material.dart';
import 'package:flutter_task/models/cart_item.dart';
import 'package:flutter_task/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/buynow.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double imageHeightFactor = 1.0;
  int quantity = 1;
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                              ConstrainedBox(
                                constraints: BoxConstraints(minHeight: 50),
                                child: IntrinsicHeight(
                                  child: Text(
                                    widget.product.title,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight:
                                      150, // set your desired minimum height
                                ),
                                child: IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        widget.product.description
                                            .split(';')
                                            .where(
                                              (item) => item.trim().isNotEmpty,
                                            )
                                            .map(
                                              (item) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                    ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "• ",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        item.trim(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "cost: \$ ${widget.product.price}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (quantity > 1) quantity--;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/minus.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        child: Text(
                                          '$quantity',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/plus.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Buynow(),
                                  Button(
                                    item: CartItem(
                                      product: widget.product,
                                      quantity: quantity,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
