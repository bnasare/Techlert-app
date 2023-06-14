// ignore_for_file: use_build_context_synchronously

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

void emailVerificationSent(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      content: SizedBox(
        height: 20,
        child: Center(
          child: Text(
            'Verification email sent',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(16),
    ),
  );
}
