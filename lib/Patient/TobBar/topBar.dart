import 'package:flutter/material.dart';
import 'package:screen_of_enaya/Patient/TobBar/HealthProfile.dart';
import 'package:screen_of_enaya/Patient/TobBar/HealthTrackers.dart';
import 'package:screen_of_enaya/Patient/TobBar/MedicalReports.dart';
import 'package:screen_of_enaya/Patient/patientBar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
//import 'package:screen_of_enaya//Patient/PatientDeatilsMain.dart';

class TopBar extends StatefulWidget {
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedPage = 0;
  List<String> _titlepage = [
    'Health profile',
    'Health trackers',
    'Medical Reports',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlepage[selectedPage]),
        backgroundColor: Color(0xFF2C3343),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(icon: Icon(Icons.flight)),
        //     Tab(icon: Icon(Icons.directions_transit)),
        //     Tab(icon: Icon(Icons.directions_car)),
        //   ],
        // ),
        // title: Text('Tabs Demo'),
      ),
      body: Column(
        children: [
          // DefaultTabController(
          //   length: 3,
          //   child: TabBarView(
          //     children: [
          //       Icon(Icons.flight, size: 350),
          //       Icon(Icons.directions_transit, size: 350),
          //       Icon(Icons.directions_car, size: 350),
          //     ],
          //   ),
          // ),
          PatientBar(),
          Divider(
            color: Colors.grey,
            height: 0.7,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Color(0xFF5B6376),
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 1.35
                : MediaQuery.of(context).size.height / 2.4,
            child: ContainedTabBarView(
                tabBarProperties: TabBarProperties(
                  indicatorColor: Colors.pink.shade600,
                  labelColor: Colors.white,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height / 26
                          : MediaQuery.of(context).size.height / 23,
                  // MediaQuery.of(context).size.height / 5,
                  //Color(0xFF2C3343),
                ),
                tabs: [
                  Text('profile'),
                  Text('trackers'),
                  Text('reports'),
                ],
                views: [
                  // Container(color: Colors.red),
                  // Container(color: Colors.green),
                  HealthProfile(),
                  HealthTrackers(),
                  MedicalReports(),
                ],
                onChange: (index) {
                  setState(() {
                    selectedPage = index;
                    print(index);
                    print(selectedPage);
                  });
                }),
          ),
        ],
      ),
    );
  }
}

Widget reportTopBar() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Image.asset(
          'images/main_report.png',
          width: 50,
          height: 30,
        ),
        MaterialButton(
          color: Colors.orange,
          onPressed: () {},
          child: Text("ADD Report"),
        )
      ],
    ),
  );
}
