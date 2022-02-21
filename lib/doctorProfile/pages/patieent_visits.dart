import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/doctorProfile/pages/new_visit.dart';

class PatientVisits extends StatefulWidget {
  const PatientVisits({ Key key }) : super(key: key);

  @override
  State<PatientVisits> createState() => _PatientVisitsState();
}

class _PatientVisitsState extends State<PatientVisits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mainColor,),
      body: SingleChildScrollView(child: 
      Column(children: [
        Text("No visits until now "),
      ],),),
       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor:mainColor,
        onPressed: () {
            Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>NewVisit()));
          setState(() {
            // i++;
          });
        },
      ),
    );
  }
}