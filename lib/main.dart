import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';
import 'body/splash_screen/spalsh_screen.dart';
import 'data.dart';
import 'patients.dart';
import 'app/genral/sharepref.dart';
import 'drawer/header.dart';
void main() async {
  await GetStorage.init();
  runApp(MyApp());
}


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
      home:MainLogin(),
      //1 SplashScreen(),
      // PatienMedicalInfo(p_name:"ali",p_file_no:"P0053",p_id:"13"),
      //MainaddPatient(),
      //PatienMedicalInfo(p_name:"ali",p_file_no:"P0053",p_id:"13"),
      //HomePatient(),
      //MainaddPatient(),
      //HomeExamner(),
      //MainProfilePatient(),
      //HomePatient(),
      //IndvidualPatients(),
      //PateintDetils1(),
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
    // Appointments(),
    // Consultaions(),
    // Monitoring(),
    //  Questions(),
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
