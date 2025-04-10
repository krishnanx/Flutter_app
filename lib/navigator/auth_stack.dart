// lib/navigation/auth_stack.dart
import 'package:flutter/material.dart';
import 'package:flutter_task/screens/InitialPage.dart'; // Adjust path if needed

class AuthStack extends StatelessWidget {
  const AuthStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => const Initialpage();
            break;

          // You can add more routes later like:
          // case '/signup':
          //   builder = (_) => const SignUpScreen();
          //   break;

          default:
            throw Exception('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
