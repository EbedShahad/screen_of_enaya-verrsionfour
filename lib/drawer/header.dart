import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/Blog/emblog.dart';
import 'package:screen_of_enaya/drawer/drawerlist.dart';
import 'package:screen_of_enaya/presistent_tabbar.dart';
import 'package:screen_of_enaya/settings/mainsetting.dart';

import '../main.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  int selectedPage;

  List<String> drawertitle = [
    'Patients',
    'Appointments',
    'Monitoring',
    'Questions',
    'Consultaion Notes',
    'Blog',
    'settings',
    'Help',
    'Privacy Policy',
    'about',
  ];

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        addAutomaticKeepAlives: false,
        dragStartBehavior: DragStartBehavior.start,
        padding: EdgeInsets.all(6.0),
        children: <Widget>[
          createHeader(),
          Currentlist(
            title: drawertitle[0],
            icon1: Icons.supervisor_account,
            ontap1: () {
              selectedPage = 0;
              // Future.delayed(Duration.zero, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              // });

              //});
            },
          ),
          Currentlist(
            title: drawertitle[1],
            icon1: Icons.event,
            ontap1: () {
              selectedPage = 1;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[2],
            icon1: Icons.event,
            ontap1: () {
              selectedPage = 3;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[3],
            icon1: Icons.border_color,
            ontap1: () {
              selectedPage = 4;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              // //});
            },
          ),
          Currentlist(
            title: drawertitle[4],
            icon1: Icons.exit_to_app,
            ontap1: () {
              selectedPage = 2;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[5],
            icon1: Icons.supervisor_account,
            ontap1: () {
              selectedPage = 0;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => EmotyBlog()),
              //   /* MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),*/
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[6],
            icon1: Icons.settings,
            ontap1: () {
              selectedPage = 0;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Settings()),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[7],
            icon1: Icons.supervisor_account,
            ontap1: () {
              selectedPage = 0;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[8],
            icon1: Icons.supervisor_account,
            ontap1: () {
              selectedPage = 0;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
          Currentlist(
            title: drawertitle[9],
            icon1: Icons.supervisor_account,
            ontap1: () {
              selectedPage = 0;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(selectedPage: selectedPage),
              //   ),
              // );
              //});
            },
          ),
        ],
      ),
    );
  }
}

Widget createHeader() {
  return DrawerHeader(
    //  margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(1.0),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("images/profile.png"),
          ),
          SizedBox(
            height: 2,
          ),
          Text("Shahad Ebed", style: TextStyle(color: Colors.white)),
          Text("Ebedshahad@gmail.com", style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.redAccent,
    ),
  );
}
