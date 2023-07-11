import 'package:flutter/material.dart';
import 'package:techlert/pages/maps_page.dart';
import 'package:techlert/pages/profile_page.dart';
import 'package:techlert/pages/shuttle_tracker_page.dart';
import 'package:techlert/pages/slides_page.dart';
import 'package:techlert/pages/techlert_main_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const MainScreenView()),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.home_filled,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/profile",
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.person_2_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/slides",
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.auto_stories_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const TrackerPage()),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.directions_bus_filled_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const MapsView()),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.map_outlined,
                    size: 30,
                  ),
                )
              ],
            )));
  }
}
