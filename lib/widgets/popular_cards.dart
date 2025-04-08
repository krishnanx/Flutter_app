import "package:flutter/material.dart";
import "package:flutter_task/widgets/button.dart";
import '../models/product.dart';
import "package:flutter_task/models/cart_item.dart";

class PopularCards extends StatelessWidget {
  final Product product;

  const PopularCards({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product.image,
                        width: 168,
                        height: 128,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cost: \$${product.price}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Button(
                          item: CartItem(product: product),
                        ), // Your custom button
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Background image
        ],
      ),
    );
  }
}
