import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techlert/components/bottomnavbar.dart';
import 'package:techlert/components/drawertile.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({Key? key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
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
      bottomNavigationBar: const CustomNavBar(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Good Morning,",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              (user?.email ?? "No Email Available")
                                  .split('@')[0],
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Image(
                            image: NetworkImage(
                              "https://img.freepik.com/premium-vector/businessman-avatar-cartoon-character-profile_18591-50581.jpg?w=740",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
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
                    const SizedBox(height: 50),
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
                                ),
                              ),
                            ),
                            const Center(
                              heightFactor: 12,
                              child: Text(
                                "Old alert will appear here.",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(); // Return an empty container when there is no data
          }
        },
      ),
    );
  }
}
