import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techlert/pages/loginpage.dart';

Future<void> resetPassword(
    BuildContext context, TextEditingController emailController) async {
  final email = emailController.text.trim();

  if (email.isEmpty) {
    _showSnackBar(context, 'Email field is empty. ');
    return;
  }

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    _showSnackBar(context, 'Password reset link sent to your email. ');
    // ignore: use_build_context_synchronously
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  } catch (e) {
    _showSnackBar(context, 'Error. Password reset link not sent. ');
  }
}

void _showSnackBar(BuildContext context, String message) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: SizedBox(
        height: 20,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(16),
    ),
  );
}
