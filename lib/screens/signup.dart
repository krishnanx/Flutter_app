import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/search.dart';
import '../providers/Auth_provider.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the provider value using ref.watch
    //final auth = ref.watch(authProvider);
    final userIdController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF40BFB4),
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(color: Color(0xFF40BFB4))),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 35),
              child: Column(
                children: [
                  Align(
                    alignment:
                        Alignment.topCenter, // This ensures proper centering
                    child: _inputs(
                      userIdController,
                      usernameController,
                      emailController,
                      passwordController,
                    ),
                  ),
                  SizedBox(height: 30),
                  _button(
                    ref,
                    userIdController,
                    usernameController,
                    emailController,
                    passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _inputs(
  TextEditingController userIdController,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Search(controller: userIdController, icon: false, placeholder: "User id"),
      SizedBox(height: 30),
      Search(
        controller: usernameController,
        icon: false,
        placeholder: "Username",
      ),
      SizedBox(height: 30),
      Search(controller: emailController, icon: false, placeholder: "Email"),
      SizedBox(height: 30),
      Search(
        controller: passwordController,
        icon: false,
        placeholder: "Password",
      ),
    ],
  );
}

Widget _button(
  WidgetRef ref,
  TextEditingController userIdController,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  return Container(
    child: ElevatedButton(
      onPressed: () {
        //for future sign up
        // final id = int.parse(userIdController.text);
        // final username = usernameController.text;
        // final email = emailController.text;
        // final password = passwordController.text;

        // Pass the individual parameters to the signup method
        ref.read(authProvider.notifier).toggleAuth();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003C39),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
