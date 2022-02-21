import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:screen_of_enaya/Consultaion/Log_Consultaion.dart';
import 'package:screen_of_enaya/Patient/TobBar/topBar.dart';
import 'package:screen_of_enaya/Patient/patientBar.dart';
import 'package:screen_of_enaya/styleApp.dart';
import 'package:flutter/cupertino.dart';

class PateintDetils1 extends StatefulWidget {
  @override
  _PateintDetils1State createState() => _PateintDetils1State();
}

class _PateintDetils1State extends State<PateintDetils1> {
  /* var size = MediaQuery.of(context).size;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double itemHeight =
        (size.height - kToolbarHeight - statusBarHeight) / 4;
    final double itemWidth = size.width / 2;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3343),
        title: Text("Patient Deatils "),
        actions: [
          IconButton(
              onPressed: () {
                print("pick a date ");
              },
              icon: Icon(Icons.calendar_today)),
        ],
      ),
      body: ListView(
        children: [
          PatientBar(),
          Row(
            children: [
              SpeacialCards(
                mainTitle: "Health",
                secTitle: "Profile",
                bgColor: Colors.blue,
                image1: "images/pateientCards/profile.png",
                ontap3: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(name: "TopBar"),
                    screen: TopBar(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => TopBar(),
                  //   ),
                  // );
                },
              ),
              SpeacialCards(
                mainTitle: "Health",
                secTitle: "Trackers",
                bgColor: Color(0xFFF16266),
                image1: "images/pateientCards/bar-chart.png",
                ontap3: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBar(),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              SpeacialCards(
                mainTitle: "Medical",
                secTitle: "Reports",
                bgColor: Color(0xFFA469E2),
                image1: "images/pateientCards/medical-report.png",
                ontap3: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBar(),
                    ),
                  );
                },
              ),
              SpeacialCards(
                mainTitle: "Health",
                secTitle: "Journal",
                bgColor: Color(0xFF20C9B2),
                image1: "images/pateientCards/medical-report.png",
                ontap3: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBar(),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              SpeacialCards(
                mainTitle: "Consultaion",
                secTitle: "Notes",
                bgColor: Color(0xFFF08F1C),
                image1: "images/pateientCards/stethoscope.png",
                ontap3: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBar(),
                    ),
                  );
                },
              ),
              SpeacialCards(
                mainTitle: "Patient",
                secTitle: "Payment",
                bgColor: Color(0xFFBCC131),
                image1: "images/pateientCards/mobile-payment.png",
                ontap3: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBar(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        child: Image(
          fit: BoxFit.cover,
          width: 30,
          color: Colors.white,
          image: AssetImage(
            "images/pateientCards/stethoscope.png",
          ),
        ),
        backgroundColor: Color(0xFFFD6769),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LogConsultaionEdit(),
            ),
          );
        },
      ),
    );
  }
}

class SpeacialCards extends StatelessWidget {
  String mainTitle;
  String secTitle;
  String image1;
  Color bgColor;
  Function ontap3;
  SpeacialCards(
      {this.mainTitle, this.secTitle, this.image1, this.bgColor, this.ontap3});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: ontap3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.shade400,
                )),
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width / 2.15
                : MediaQuery.of(context).size.width / 2.88,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 7
                : MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: bgColor,
                        child: Image(
                          fit: BoxFit.fitHeight,
                          width: 50,
                          color: Colors.white60,
                          image: AssetImage(
                            image1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mainTitle,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                      Text(
                        secTitle,
                        style: TextStyle(fontSize: 17, color: bgColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*class GridCard extends StatelessWidget {
  const GridCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: GridView.count(crossAxisCount: crossAxisCount));
  }
}*/

class EditBasicProfile extends StatefulWidget {
  @override
  _EditBasicProfileState createState() => _EditBasicProfileState();
}

class _EditBasicProfileState extends State<EditBasicProfile> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3343),
        title: Text("Edit Basic Profile"),
        actions: [],
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF0BD1B5),
              child: Image(
                color: Colors.orange,
                height: 50,
                fit: BoxFit.contain,
                image: AssetImage("images/profile1.png"),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Container(
                    width: 100,
                    child: TextField(
                      cursorColor: tealColor,
                      // cursorHeight: 2.0,
                      //  obscureText: true,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        // labelText: "Shahad",
                        hintText: 'Shahad',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Name",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Container(
                    width: 100,
                    child: TextField(
                      cursorColor: tealColor,
                      // cursorHeight: 2.0,
                      //  obscureText: true,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        // labelText: "Shahad",
                        hintText: 'Shahad',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1900, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                // Do something
              },
            ),
          ),
          Row(
            children: [
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
              Container(
                width: 100,
                child: TextField(
                  cursorColor: tealColor,
                  // cursorHeight: 2.0,
                  //  obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    // labelText: "Shahad",
                    hintText: 'Shahad',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
