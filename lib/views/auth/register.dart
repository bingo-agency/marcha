import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authController.dart';

class Register extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                authController.createUser(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text("Register"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
