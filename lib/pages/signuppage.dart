import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlert/components/signup_functions.dart';
import 'package:techlert/pages/choosepage.dart';
import 'package:techlert/pages/loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
                fontSize: 25, color: Colors.black, letterSpacing: 3),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ChoosePage();
                  },
                ));
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 25,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 25, right: 25, bottom: 0),
                  child: Image.asset('assets/images/signup.png'),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      style: GoogleFonts.urbanist(fontSize: 20),
                      controller: firstNameController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'First name',
                          labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      style: GoogleFonts.urbanist(fontSize: 20),
                      controller: lastNameController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Last name',
                          labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.urbanist(fontSize: 20),
                      controller: emailController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(Icons.email_outlined)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      style: GoogleFonts.urbanist(fontSize: 20),
                      controller: passwordController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObscured = !isPasswordObscured;
                            });
                          },
                          child: Icon(isPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: isPasswordObscured,
                      obscuringCharacter: '*',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      style: GoogleFonts.urbanist(fontSize: 20),
                      controller: confirmPasswordController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isConfirmPasswordObscured =
                                  !isConfirmPasswordObscured;
                            });
                          },
                          child: Icon(isConfirmPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: isConfirmPasswordObscured,
                      obscuringCharacter: '*',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: DecoratedBox(
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
                          minimumSize: const Size(350, 60),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          if (areAllFieldsFilled(
                              emailController,
                              passwordController,
                              firstNameController,
                              lastNameController,
                              confirmPasswordController)) {
                            signUp(
                                context,
                                emailController,
                                passwordController,
                                firstNameController,
                                lastNameController,
                                confirmPasswordController);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                content: SizedBox(
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      'Fill all fields to continue. ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                duration: Duration(seconds: 5),
                                margin: EdgeInsets.all(16),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.ubuntu(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ));
                            },
                            child: const Text(
                              'Log In',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
