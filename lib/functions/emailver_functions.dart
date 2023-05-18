import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techlert/pages/loginpage.dart';

void checkEmailVerification(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.reload();
    if (user.emailVerified) {
      // If email is already verified, navigate to the login page
      navigateToLoginPage(context);
    }
  }
}

void navigateToLoginPage(BuildContext context) {
  // Move the user to the Login page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
