import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlert/functions/signup_functions.dart';
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

  bool isObscure = true;

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
            style: GoogleFonts.abel(
                fontSize: 30, color: Colors.black, letterSpacing: 2),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.white,
          toolbarHeight: 70,
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
              //const SizedBox(height: 30),
              Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: firstNameController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'First name',
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'John',
                          suffixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: lastNameController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Last name',
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Amoako',
                          suffixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: emailController,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'bigboy@gmail.com',
                          suffixIcon: const Icon(Icons.email_outlined)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: passwordController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Set your passowrd',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: isObscure,
                      obscuringCharacter: '*',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: confirmPasswordController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Cornfirm password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Retype password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: isObscure,
                      obscuringCharacter: '*',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
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
                          style: GoogleFonts.comfortaa(
                              fontSize: 23, letterSpacing: 1.5),
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
