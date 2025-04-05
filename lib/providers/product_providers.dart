import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/services/product_api.dart';
import 'package:flutter_task/models/product.dart';

final _productApiProvider = Provider<ProductApi>((ref) => ProductApi());

final featuredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final api = ref.read(_productApiProvider);

  final allProducts = await api.fetchAllProducts();

  allProducts.shuffle();
  return allProducts.take(4).toList();
});
final categoryProductProvider = FutureProvider.family<List<Product>, String>((
  ref,
  category,
) async {
  final api = ref.read(_productApiProvider);
  final categoryProducts = await api.fetchProductsByCategory(category);
  return categoryProducts;
});

final popularProductProvider = FutureProvider<List<Product>>((ref) async {
  final api = ref.read(_productApiProvider);

  final allProducts = await api.fetchAllProducts();

  allProducts.shuffle();
  return allProducts.take(4).toList();
});
