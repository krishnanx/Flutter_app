import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/models/product.dart';

class FavoriteNotifier extends StateNotifier<List<int>> {
  FavoriteNotifier() : super([]);

  void toggleFavorite(Product product) {
    if (state.contains(product.id)) {
      state = state.where((id) => id != product.id).toList();
    } else {
      state = [...state, product.id];
    }
  }

  bool isFavorite(Product product) {
    return state.contains(product.id);
  }
}

// Providing the notifier with correct types
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<int>>((
  ref,
) {
  return FavoriteNotifier();
});
