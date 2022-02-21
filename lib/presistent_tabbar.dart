import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:screen_of_enaya/Patient/PatientDeatilsMain.dart';
import 'patients.dart';
// import 'dart:io';
// import 'dart:js';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller;
  final pageController = PageController();
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _screens = [
    Patients(),
    // Appointments(),
    // Consultaions(),
   // Monitoring(),
  //  Questions(),
  ];

  List<PersistentBottomNavBarItem> _navItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "Patients",
      textStyle: TextStyle(color: Colors.white),
      activeColorPrimary: Color(0xFF2C3343),
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
      // routeAndNavigatorSettings: RouteAndNavigatorSettings(
      //   initialRoute: '/',
      //   routes: {
      //     '/PatientProfile': (context) => PateintDetils1(),
      //     // '/second': (context) => MainScreen3(),
      //   },
      // ),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.calendarDay),
      title: "Home",
      textStyle: TextStyle(color: Colors.white),
      activeColorPrimary: Color(0xFF2C3343),
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.stethoscope),
      title: "Home",
      textStyle: TextStyle(color: Colors.white),
      activeColorPrimary: Color(0xFF2C3343),
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.chartBar),
      title: "Home",
      textStyle: TextStyle(color: Colors.white),
      activeColorPrimary: Color(0xFF2C3343),
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.comments),
      title: "Home",
      textStyle: TextStyle(color: Colors.white),
      activeColorPrimary: Color(0xFF2C3343),
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navItems,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style10,
    );
  }
}
