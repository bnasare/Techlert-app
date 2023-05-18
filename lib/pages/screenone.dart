import 'package:flutter/material.dart';
import 'package:techlert/pages/screentwo.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final int _current = 0;
  // Define a list of colleges to display
  final List<Map<String, dynamic>> _colleges = [
    {
      'name': 'College of Science (CoS)',
      'programs': [
        "BSc. Computer Science",
        "BSc. Mathematics",
        "BSc. Statistics",
        "BSc. Actuarial Science",
        "BSc. Physics",
        "BSc. Chemistry",
        "BSc. Biochemistry",
        "BSc. Biological Sciences",
        "BSc. Environmental Science",
        "BSc. Food Science and Technology",
        "BSc. Meteorology and Climate Science",
        "BSc. Optometry",
      ]
    },
    {
      'name': 'College of Health Science (CoHS)',
      'programs': [
        "Pharm D (Doctor of Pharmacy)",
        "BSc. Herbal Medicine",
        "BSc. Human Biology (Medicine)",
        "BSc. Medical Laboratory Technology",
        "BSc. Sports and Exercise Science",
        "BSc. Nursing",
        "BSc. Midwifery",
        "BSc. BDS Dental Surgery",
        "Doctor of Veterinary Medicine",
        "BSc. Sonography",
        "BSc. Disability & Rehabilitation Studies"
      ]
    },
    {
      'name': 'College of Agriculture and Natural Resources (CANR)',
      'programs': [
        "BSc. Agriculture",
        "BSc. Natural Resources Management",
        "BSc. Post Harvest Technology",
        "BSc. Dairy and Meat Science and Technology",
        "BSc. Landscape Design and Management",
        "BSc. Agricultural Biotechnology",
        "BSc. Agribusiness Management",
        "BSc. Forest Resources Technology",
        "BSc. Aquaculture & Water Resources Management",
      ]
    },
    {
      'name': 'College of Art and Built Environment (CABE)',
      'programs': [
        "BSc. Architecture",
        "BSc. Construction Technology & Management",
        "BSc. Quantity Surveying & Construction Economics",
        "BSc. Development Planning",
        "BSc. Human Settlement Planning",
        "BSc. Land Economy",
        "BSc. Real Estate",
        "BFA Painting and Sculpture",
        "BA Communication Design",
        "BA Industrial Art",
        "BA Integrated Rural Art and Industry",
        "BA Publishing Studies",
        "BA Communication Design",
        "BFA Painting and Sculpture"
      ]
    },
    {
      'name': 'College of Engineering (CoE)',
      'programs': [
        "BSc. Agricultural Engineering",
        "BSc. Chemical Engineering",
        "BSc. Civil Engineering",
        "BSc. Geomatic Engineering",
        "BSc. Materials Engineering",
        "BSc. Mechanical Engineering",
        "BSc. Electrical & Electronic Engineering",
        "BSc. Computer Engineering",
        "BSc. Aerospace Engineering",
        "BSc. Petroleum Engineering",
        "BSc. Telecommunication Engineering",
        "BSc. Geological Engineering",
        "BSc. Biomedical Engineering",
        "BSc. Petrochemical Engineering",
        "BSc. Metallurgical Engineering",
        "BSc. Automobile Engineering",
        "BSc. Industrial Engineering",
        "BSc. Marine Engineering",
      ]
    },
    {
      'name': 'College of Humanities and Social Sciences (CHSS)',
      'programs': [
        "BA Economics",
        "BA Geography and Rural Development",
        "BA Sociology",
        "BA Social Work",
        "BA Religious Studies",
        "BA History",
        "BA Political Studies",
        "BA French",
        "BA Akan",
        "BA Culture and Tourism",
        "BA English",
        "BSc. Business Administration",
        "BSc. LLB",
        "BA Economics",
        "BSc. Business Administration",
        "BA Geography and Rural Development",
        "BA Sociology",
        "BA Social Work",
        "BA History",
        "BA Political Studies",
        "BA French",
        "BA Culture and Tourism",
        "BA English",
        "BA Religious Studies"
      ]
    },
    // ...
  ];

  String? _selectedCollege;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCollege != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScreenTwo(
                                    college: _selectedCollege!,
                                    programs: _colleges.firstWhere(
                                      (college) =>
                                          college['name'] == _selectedCollege,
                                    )['programs'],
                                  ),
                                ),
                              )
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select a college')));
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        height: 30,
                        width: 30,
                        child: const Icon(Icons.arrow_forward_ios_outlined)),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text('Select your College and Programme',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Step 1 of 3',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              child: Text('What College are you in?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            // Wrap the RadioListTile widget with a Material widget
            ..._colleges.map(
              (college) => RadioListTile(
                title: Text(college['name']),
                value: college['name'],
                activeColor: Colors.black,
                groupValue: _selectedCollege,
                onChanged: (value) {
                  setState(() {
                    _selectedCollege = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
