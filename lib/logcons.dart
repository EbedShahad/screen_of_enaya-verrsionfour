import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogCons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          //  shape: ShapeBorder.circle,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Doctor name "),
                    Text("Gender "),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
