import "package:flutter_task/models/cart_item.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);
  void addToCart(CartItem product) {
    final index = state.indexWhere(
      (item) => item.product.id == product.product.id,
    );
    if (index != -1) {
      final updated = [...state];
      updated[index].quantity += product.quantity;
      state = updated;
    } else {
      state = [...state, product];
    }
  }

  void removeFromCart(CartItem product) {
    state =
        state.where((item) => item.product.id != product.product.id).toList();
  }

  void increaseNumber(CartItem product) {
    final index = state.indexWhere(
      (item) => item.product.id == product.product.id,
    );
    if (index != -1) {
      final updated = [...state];
      updated[index].quantity++;
      state = updated;
    }
  }

  void decreaseNumber(CartItem product) {
    final index = state.indexWhere(
      (item) => item.product.id == product.product.id,
    );
    if (index != -1) {
      final updated = [...state];
      if (updated[index].quantity > 1) {
        updated[index].quantity--;
        state = updated;
      } else {
        removeFromCart(product);
      }
    }
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  double get deliveryFee => 2.99;

  double get taxes => subtotal * 0.10;

  double get total => subtotal + deliveryFee + taxes;
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
