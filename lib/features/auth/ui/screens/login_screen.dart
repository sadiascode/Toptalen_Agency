import 'package:flutter/material.dart';
import 'package:top_talent_agency/common/app_shell.dart';
import 'package:top_talent_agency/common/custom_button.dart';
import 'package:top_talent_agency/core/roles.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_textfield.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UiUserRole? getRoleFromCredentials(String email, String password) {
    if (email == "admin@gmail.com" && password == "123456") {
      return UiUserRole.admin;
    } else if (email == "manager@gmail.com" && password == "123456") {
      return UiUserRole.manager;
    } else if (email == "creator@gmail.com" && password == "123456") {
      return UiUserRole.creator;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScreen(
        svgPath: 'assets/Group.svg',
        svgHeight: 180,
        svgWidth: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Welcome to Top Talent Agency",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Email"),
            const SizedBox(height: 6),
            CustomTextfield(
              hintText: "Enter your email address",
              controller: emailController,
            ),

            const SizedBox(height: 12),
            const Text("Password"),
            const SizedBox(height: 6),
            CustomTextfield(
              hintText: "Password",
              isPassword: true,
              controller: passwordController,
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text("Remember Me", style: TextStyle(fontSize: 14)),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgotScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Sign in",
              onTap: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                final role = getRoleFromCredentials(email, password);

                if (role == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid email or password")),
                  );
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AppShell(role: role),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
