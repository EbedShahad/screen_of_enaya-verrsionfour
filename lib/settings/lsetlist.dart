import 'package:flutter/material.dart';
import 'package:screen_of_enaya/styleApp.dart';

class Listset extends StatelessWidget {
  //const listset({Key key}) : super(key: key);
  String labelTitle;
  IconData icon2;
  Function ontap2;
  Listset({this.labelTitle, this.icon2, this.ontap2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: ontap2(),
          child: Row(
            children: [
              Icon(
                icon2,
                color: tealColor,
                //color: Color.fromRGBO(71, 212, 187, 255),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(labelTitle),
              Spacer(),
              Icon(
                Icons.arrow_right_outlined,
                color: Colors.grey.shade300,
                //color: Color.fromRGBO(71, 212, 187, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
