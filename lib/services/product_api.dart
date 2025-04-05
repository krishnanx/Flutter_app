import 'package:dio/dio.dart';
import "package:flutter_task/models/product.dart";

class ProductApi {
  final Dio _dio = Dio();
  Future<List<Product>> fetchAllProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await _dio.get(
      'https://fakestoreapi.com/products/category/$category',
    );
    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
