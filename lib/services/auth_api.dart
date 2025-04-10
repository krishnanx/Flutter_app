import 'dart:convert';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<String?> login(String username, String password) async {
    try {
      print(username);
      print(password);
      print('$_baseUrl/auth/login');
      final response = await _dio.post(
        '$_baseUrl/login',
        data: json.encode({'username': username, 'password': password}),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return data['token'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<String?> signup(
    int id,
    String username,
    String email,
    String password,
  ) async {
    try {
      print(id);
      print(username);
      print(email);
      print(password);
      print('$_baseUrl/users');
      final response = await _dio.post(
        '$_baseUrl/users',
        data: json.encode({
          "id": id,
          'username': username,
          "email": email,
          'password': password,
        }),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("you are in!!");
        final data = response.data;
        print(response.data);
        return data['token'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
