import 'package:flutter/material.dart';
import 'package:techlert/pages/screenone.dart';
import 'screentwo.dart';
import 'package:techlert/pages/screenthree.dart';

class SelectDetails extends StatefulWidget {
  const SelectDetails({super.key});

  @override
  State<SelectDetails> createState() => _SelectDetailsState();
}

class _SelectDetailsState extends State<SelectDetails> {
  final int _currentPageIndex = 0;

  final List _pages = [
    ScreenOne(),
    const ScreenTwo(
      college: '',
      programs: [],
    ),
    ScreenThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Text(_steps[_currentPageIndex]),
            _pages[_currentPageIndex]
          ],
        ),
      ),
    );
  }
}
