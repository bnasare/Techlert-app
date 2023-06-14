import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlert/components/login_functions.dart';
import 'package:techlert/pages/choosepage.dart';
import 'package:techlert/pages/forgotpassword.dart';
import 'package:techlert/pages/signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool click = true;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadSavedCredentials(emailController, passwordController, rememberMe);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: GoogleFonts.poppins(
              fontSize: 25,
              letterSpacing: 3,
              color: Colors.black,
            ),
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 25, right: 25, bottom: 0),
                    child: Image.asset('assets/images/login.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: const Icon(Icons.email_outlined),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 15, bottom: 0),
                      child: TextFormField(
                        style: GoogleFonts.urbanist(fontSize: 20),
                        controller: passwordController,
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Password',
                          labelStyle: GoogleFonts.ubuntu(fontSize: 16),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: Icon(
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscuringCharacter: '*',
                        obscureText: isObscure,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Reset Password?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17),
                          ),
                        )),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Remember me next time',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                rememberMe = !rememberMe;
                              });
                            },
                            child: Icon(
                              rememberMe
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank,
                              color: rememberMe
                                  ? const Color.fromARGB(255, 48, 46, 46)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DecoratedBox(
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
                            minimumSize: const Size(350, 60),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            signIn(
                              context,
                              emailController,
                              passwordController,
                              _formKey,
                              rememberMe,
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.comfortaa(
                                fontSize: 23, letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Forgotten your password?',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignupPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
