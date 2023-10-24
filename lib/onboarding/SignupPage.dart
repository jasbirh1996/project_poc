import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_poc/util/OpionSelector.dart';

import '../auth/controller/AuthController.dart';


class SignUpPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           OptionSpinner(),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email',border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password',border: OutlineInputBorder()),
              obscureText: true,
            ),

            const SizedBox(height: 60),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              // 20 pixels margin on both sides
              child: ElevatedButton(
                onPressed: () {


                  _authController.signUp(
                      emailController.text, passwordController.text,professionController.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  // Set the background color to light orange
                  padding: EdgeInsets.all(16.0), // Add padding to the button
                ),
                child: Container(
                  width: double.infinity, // Match parent width
                  child: const Center(
                    child: Text('SignUp'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
