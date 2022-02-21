import 'package:flutter/material.dart';
import 'package:screen_of_enaya/Patient/PatientDeatilsMain.dart';
import 'package:screen_of_enaya/add_patient/add_patient.dart';
import 'package:screen_of_enaya/doctorProfile/pages/profile_view.dart';
import 'package:screen_of_enaya/presistent_tabbar.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/OTP_Page.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/Screen0.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/enterUserName.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/resetPhone.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/resetpass.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/screen1.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/signUp.dart';
import 'Patient/TobBar/topBar.dart';
import 'appointments.dart';
import 'consultaion.dart';
import 'data.dart';

import 'monitoring.dart';
import 'patients.dart';
import 'questions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer/header.dart';
//import 'package:font_awesome_flutter_example/icons.dart';

void main() => runApp(MyApp());
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//    // splash screen to show once
//   // await _init().then((firstLaunch) {
//     runApp(MyApp(firstLaunch: firstLaunch));
//    // splash screen to show once
//   //  }
//   );
// }
// splash screen to show once
// Future<bool> _init() async {
//   bool firstLaunch = await sharingData().getFirstTimeLaunch();

//   return firstLaunch;
// }

class MyApp extends StatelessWidget {
  final bool firstLaunch;

  const MyApp({Key key, this.firstLaunch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: _buildShrineTheme(),

      title: 'Care',
      home:signUp(),
      //HomeScreen(),
      // (selectedpage:0),
      // home: firstLaunch ? signUp() : Screen0(),
      debugShowCheckedModeBanner: false,
      /* routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.selectedPage = 2});
  int selectedPage;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void initState() {
    if (widget.selectedPage == null) {
      setState(() {
        widget.selectedPage = 0;
      });
    }
  }

  List<String> _titlepage = [
    'Patients',
    'Appointments',
    'Consultaions',
    'Monitoring',
    'Questions'
  ];

  final _pageOptions = [
    Patients(),
    Appointments(),
    Consultaions(),
    Monitoring(),
    Questions(),
  ];

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBar2 = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 15.0,
      elevation: 20.0,
      //  type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedPage,
      // currentIndex: _currentIndex,
      backgroundColor: colorScheme.surface,
      selectedItemColor: Colors.blue,
      // selectedItemColor: colorScheme.onSurface,
      unselectedItemColor: colorScheme.onSurface.withOpacity(.70),
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
      items: [
        BottomNavigationBarItem(
          title: Text(tab1,
              style: TextStyle(
                fontSize: tabsize,
                fontWeight: FontWeight.normal,
              )),
          icon: Icon(FontAwesomeIcons.userFriends, color: Colors.grey),
        ),
        BottomNavigationBarItem(
          title: Text(tab2, style: TextStyle(fontSize: tabsize)),
          icon: Icon(FontAwesomeIcons.calendarDay),
        ),
        BottomNavigationBarItem(
          title: Text(tab3, style: TextStyle(fontSize: tabsize)),
          icon: Icon(FontAwesomeIcons.stethoscope),
        ),
        BottomNavigationBarItem(
          title: Text(tab4, style: TextStyle(fontSize: tabsize)),
          icon: Icon(FontAwesomeIcons.chartBar),
        ),
        BottomNavigationBarItem(
          title: Text(tab5, style: TextStyle(fontSize: tabsize)),
          icon: Icon(FontAwesomeIcons.comments),
        ),
      ],
      onTap: (index) {
        setState(() {
          widget.selectedPage = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlepage[widget.selectedPage],
            style: TextStyle(
                fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
        backgroundColor: Color(0xFF2C3343),
        elevation: 0,
        centerTitle: true,
        actions: [],
      ),
      drawer: AppDrawer(),
      body: _pageOptions[widget.selectedPage],
      bottomNavigationBar: bottomNavigationBar2,
    );
  }
}
