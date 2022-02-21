import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Patient name "),
                    Text("Gender"),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Switch(
                      onChanged: null,
                      value: true,
                      activeTrackColor: Colors.teal,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
