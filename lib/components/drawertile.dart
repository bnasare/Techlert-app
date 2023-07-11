import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techlert/pages/loginpage.dart';
import 'package:techlert/pages/maps_page.dart';
import 'package:techlert/pages/shuttle_tracker_page.dart';
import 'package:techlert/pages/slides_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tight(const Size(double.infinity, 50)),
              child: DrawerHeader(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 20, color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const TrackerPage()),
                  ),
                );
              },
              title: const Text(
                "Shuttle Tracker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MapsView()),
                  ),
                );
              },
              title: const Text(
                "Map",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "Popular places",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(height: 20, color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SlidesPage()),
                  ),
                );
              },
              title: const Text(
                "Course Slides",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "Past Questions",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(
            height: 30,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "Support",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
