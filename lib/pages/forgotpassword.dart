import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlert/components/forgotpassword_functions.dart';
import 'package:techlert/pages/loginpage.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
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
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 60, right: 70, top: 30),
          child: Column(
            children: [
              TextField(
                style: GoogleFonts.urbanist(fontSize: 20),
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.ubuntu(fontSize: 16)),
              ),
              const SizedBox(height: 20.0),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 99, 21, 15),
                      Colors.redAccent,
                    ],
                    stops: [0.35, 1.0],
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
                    resetPassword(context, emailController);
                  },
                  child: Text(
                    'RESET PASSWORD',
                    style: GoogleFonts.ubuntu(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
