import 'package:flutter/material.dart';
import 'package:flutter_task/navigator/main_tab_screen.dart';
import 'package:flutter_task/navigator/auth_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isLoggedIn = true; // simulate auth

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigation App',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MainTabScreen() : const AuthStack(),
    );
  }
}
