import 'package:flutter/material.dart';
import 'package:techlert/pages/selectdetails.dart';

class KnowAbout extends StatefulWidget {
  const KnowAbout({super.key});

  @override
  State<KnowAbout> createState() => _KnowAboutState();
}

class _KnowAboutState extends State<KnowAbout> {
  int _current = 0;
  final int _maxIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              children: [
                Stack(children: [
                  Center(
                    child: Image.asset(
                      'assets/images/learn.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Welcome on board',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  )
                ]),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Text(
                            'Google Map to help you navigate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/pasco.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Text(
                            'Courses Slides and Past Questions available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    width: 25,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? const Color.fromARGB(158, 155, 154, 154)
                          : const Color.fromARGB(255, 215, 212, 212),
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    if (_current == _maxIndex) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectDetails()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectDetails()),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    _current == _maxIndex ? 'CONTINUE' : 'SKIP',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
