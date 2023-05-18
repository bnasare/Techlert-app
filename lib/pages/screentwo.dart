import 'package:flutter/material.dart';
import 'package:techlert/pages/screenthree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class ProgramProvider with ChangeNotifier {
  static String? selectedProgram; // Make selectedProgram static

  void updateSelectedProgram(String program) {
    selectedProgram = program;
    notifyListeners();
  }
}

class ScreenTwo extends StatelessWidget {
  final String college;
  final List<String> programs;

  const ScreenTwo({
    Key? key,
    required this.college,
    required this.programs,
  }) : super(key: key);

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
                              color: Colors.red,
                            ),
                            height: 30,
                            width: 30,
                            child:
                                const Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (ProgramProvider.selectedProgram != null) {
                              updateUserProgram(
                                  ProgramProvider.selectedProgram!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ScreenThree();
                                }),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select a program'),
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
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      'Select your College and Program',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Step 2 of 3',
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
                            color: ProgramProvider.selectedProgram ==
                                    programs[index]
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'What Program do you offer?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: programs
                            .map(
                              (program) => RadioListTile(
                                title: Text(program),
                                value: program,
                                activeColor: Colors.black,
                                groupValue: ProgramProvider
                                    .selectedProgram, // Update the reference
                                onChanged: (value) {
                                  programProvider.updateSelectedProgram(value!);
                                  updateUserProgram(
                                      ProgramProvider.selectedProgram!);
                                },
                              ),
                            )
                            .toList(),
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

  Future<void> updateUserProgram(String selectedProgram) async {
    final String? email = FirebaseAuth.instance.currentUser?.email;

    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    final QuerySnapshot querySnapshot =
        await usersCollection.where('email', isEqualTo: email).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      final DocumentReference documentReference = documentSnapshot.reference;

      await documentReference.update({
        'program': selectedProgram,
        'college': college,
      });

      print('Program and college updated successfully!');
    } else {
      print('User document not found!');
    }
  }
}
