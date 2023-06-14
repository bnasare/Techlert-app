import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techlert/pages/emailver.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
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

Future<void> signUp(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController confirmPasswordController) async {
  if (passwordConfirmed(confirmPasswordController, passwordController)) {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Send email verification to the user
      try {
        await userCredential.user?.sendEmailVerification();
        showSnackBar(
            context, 'A verification mail has been sent to your email.');
      } catch (e) {
        showSnackBar(
            context, 'Failed to send verification email. Please try again.');
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const EmailVerificationPage(),
        ),
      );

      await addUserDetails(firstNameController.text.trim(),
          lastNameController.text.trim(), emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Password should be at least 6 characters long.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar(context, 'Failed to create a user. Please try again.');
    }
  } else {
    showSnackBar(context, 'Passwords do not match.');
  }
}

Future<void> addUserDetails(
    String firstName, String lastName, String email) async {
  await FirebaseFirestore.instance.collection('users').add({
    'first name': firstName,
    'last name': lastName,
    'email': email,
  });
}

bool passwordConfirmed(TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
  if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
    return true;
  } else {
    return false;
  }
}

bool areAllFieldsFilled(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController confirmPasswordController) {
  return firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty;
}
