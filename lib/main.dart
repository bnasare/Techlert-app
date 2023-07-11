import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techlert/authentication/auth.dart';
import 'package:techlert/pages/maps_page.dart';
import 'package:techlert/pages/profile_page.dart';
import 'package:techlert/pages/shuttle_tracker_page.dart';
import 'package:techlert/pages/slides_page.dart';
import 'package:techlert/pages/techlert_main_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    routes: {
      "/profile": (context) => const ProfilePage(),
      "/slides": (context) => const SlidesPage(),
    },
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainScreenView();
  }
}
