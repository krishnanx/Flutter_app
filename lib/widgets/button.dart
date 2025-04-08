import 'package:flutter/material.dart';
import '../providers/cart_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

class Button extends ConsumerWidget {
  final CartItem item;
  const Button({super.key, required this.item});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // Optional: handle button tap here
        ref.read(cartProvider.notifier).addToCart(item);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF37A99B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "Add to cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
