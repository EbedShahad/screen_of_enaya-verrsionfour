import 'package:flutter/material.dart';
import 'package:screen_of_enaya/Patient/PatientDeatilsMain.dart';
import 'package:screen_of_enaya/data.dart';
import 'package:screen_of_enaya/styleApp.dart';

class PatientBar extends StatefulWidget {
  @override
  _PatientBarState createState() => _PatientBarState();
}

class _PatientBarState extends State<PatientBar> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF5B6376),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF0BD1B5),
                      child: Image(
                        color: Colors.orange,
                        height: 50,
                        fit: BoxFit.contain,
                        image: AssetImage("images/profile1.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      pname,
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
              Spacer(),
              Column(
                children: [
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: tealColor,
                    activeColor: tealColor,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBasicProfile(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
