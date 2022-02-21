import 'package:flutter/material.dart';
import 'package:screen_of_enaya/data.dart';

class Currentlist extends StatelessWidget {
  @override
  String title;
  IconData icon1;
  Function ontap1;
  Currentlist({this.title, this.icon1, this.ontap1});

  Widget build(BuildContext context) {
    return ListTile(
      //  width:20.0,
      // dense: ,
      //  contentPadding: EdgeInsets.all(0.1),
      leading: Icon(icon1),
      title: Text(
        title,
        style: TextStyle(fontSize: fsize),
      ),
      onTap: ontap1,
    );
  }
}
