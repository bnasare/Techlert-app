import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlert/components/emailver_functions.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Verification',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.black,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your email is not verified!',
              style: GoogleFonts.adamina(fontSize: 25),
            ),
            Text(
              'Verify before logging in.',
              style: GoogleFonts.adamina(fontSize: 25),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 99, 21, 15),
                    Colors.redAccent,
                  ],
                  stops: [0.35, 1.0], // Adjust the stops here
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 30),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  // Request email verification resend
                  FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  emailVerificationSent(context);
                },
                child: Text(
                  'RESEND VERIFICATION MAIL',
                  style: GoogleFonts.ubuntu(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                navigateToLoginPage(context);
              },
              child: Text(
                'Login',
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
