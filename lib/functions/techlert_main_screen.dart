import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techlert/pages/loginpage.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: DrawerHeader(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ))),
            ),
            const Divider(height: 20, color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Shuttle Tracker",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Map",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Popular places",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const Divider(height: 20, color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Course Slides",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Past Questions",
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                title: const Text("Settings",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("Support",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {},
                title: const Text("About",
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                    color: Colors.redAccent),
                child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info,
              color: Colors.black,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_filled,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_2_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.auto_stories_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.directions_bus_filled_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.map_outlined,
                    size: 30,
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: Text(
                          "Good Morning,",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Philip Cudjoe",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Image(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/businessman-avatar-cartoon-character-profile_18591-50581.jpg?w=740"),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alert Box",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(255, 252, 252, 1),
                  ),
                  height: 150,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "New alert will appear here.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 252, 252, 1),
                    ),
                    height: 330,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Clear all",
                                style: TextStyle(color: Colors.blueAccent),
                              )),
                        ),
                        const Center(
                          heightFactor: 12,
                          child: Text(
                            "Old alert will appear here.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
