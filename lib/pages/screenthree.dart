// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlert/functions/screenthree_functions.dart';

class ProgramProvider with ChangeNotifier {
  static String?
      selectedEducationalstance; // Make selectedEducationalstance static

  void updateSelectedEducationalstance(String stance) {
    selectedEducationalstance = stance;
    notifyListeners();
  }
}

class ScreenThree extends StatelessWidget {
  ScreenThree({Key? key}) : super(key: key);

  Future<void> updateUserLevel() async {
    final String? email = FirebaseAuth.instance.currentUser?.email;

    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    final QuerySnapshot querySnapshot =
        await usersCollection.where('email', isEqualTo: email).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      final DocumentReference documentReference = documentSnapshot.reference;

      await documentReference
          .update({'Level': ProgramProvider.selectedEducationalstance});

      print('Program and college updated successfully!');
    } else {
      print('User document not found!');
    }
  }

  Future<void> _saveSelectedStance(String educationalstance) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedEducationalStance', educationalstance);
  }

  final int _current = 2;
  // Define a list of colleges to display
  final List<String> _educationalstance = [
    'Level 100',
    'Level 200',
    'Level 300',
    'Level 400',
    'Level 500',
    'Level 600',
    'PostGraduate',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProgramProvider(),
      child: Consumer<ProgramProvider>(
        builder: (context, programProvider, _) => Material(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red),
                            height: 30,
                            width: 30,
                            child:
                                const Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (ProgramProvider.selectedEducationalstance !=
                                null) {
                              updateUserLevel();
                              _saveSelectedStance(
                                  ProgramProvider.selectedEducationalstance!);
                              navigateToConfirmationPage(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select your stance'),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            height: 30,
                            width: 30,
                            child: const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      'Select your College and Programme',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Step 3 of 3',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            color: _current == index ? Colors.red : Colors.grey,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Current educational stance?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Wrap the RadioListTile widget with a Material widget
                  ..._educationalstance.map(
                    (stance) => Material(
                      child: RadioListTile(
                        title: Text(stance),
                        value: stance,
                        activeColor: Colors.black,
                        groupValue: ProgramProvider
                            .selectedEducationalstance, // Update the reference
                        onChanged: (value) {
                          programProvider
                              .updateSelectedEducationalstance(value as String);
                          _saveSelectedStance(value as String);
                          updateUserLevel();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
