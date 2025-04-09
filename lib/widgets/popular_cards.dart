import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:flutter_task/widgets/button.dart";
import '../models/product.dart';
import "package:flutter_task/models/cart_item.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorite_providers.dart';

class PopularCards extends ConsumerStatefulWidget {
  final Product product;
  final VoidCallback onTap;
  const PopularCards({super.key, required this.product, required this.onTap});
  ConsumerState<PopularCards> createState() => _PopularState();
}

class _PopularState extends ConsumerState<PopularCards> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              widget.product.image,
                              width: 168,
                              height: 128,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 5,
                        child: GestureDetector(
                          onTap:
                              () => {
                                ref
                                    .read(favoriteProvider.notifier)
                                    .toggleFavorite(widget.product),
                              },
                          child: Container(
                            child:
                                ref
                                        .read(favoriteProvider.notifier)
                                        .isFavorite(widget.product)
                                    ? SvgPicture.asset(
                                      "assets/icons/Active.svg",
                                      width: 60,
                                      height: 60,
                                    )
                                    : SvgPicture.asset(
                                      "assets/icons/Love.svg",
                                      width: 60,
                                      height: 60,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          widget.product.title,
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
                              "Cost: \$${widget.product.price}",
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
                            item: CartItem(product: widget.product),
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
      ),
    );
  }
}
