import 'package:flutter/material.dart';

class Pcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Card(
      clipBehavior: Clip.hardEdge,
      //color: Colors.grey,
      child: */
        Container(
      //  height: 50.0,
      width: double.infinity,
      //  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Column(
            children: [
              /*CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xFF096BFD),
                  child:
                  */
              CircleAvatar(
                foregroundColor: Colors.grey,
                radius: 30,
                backgroundImage: AssetImage('images/profile1.png'),
              ),
              //),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pateient name ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Gender ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.ac_unit_rounded),
              //Container(),
              Image.asset(
                "images/headphone.png",
                width: 30.0,
                height: 80.0,
                // color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
      // ),
    );
    //Card( );

    // shadowColor: Colors.orange,
    /* shadowColor: Colors.black,
      // elevation: 10.0,
      child: Container(
        //card doctor
        height: 80.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.2),
          // borderRadius: BorderRadius.circular(15),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /*SizedBox(
                  width: 10.0,
                ),*/
            CircleAvatar(
              child: Image.asset('images/patients.png'),
              foregroundColor: Colors.grey,
            ),
            Text(
              "Amjad Adil",
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.medical_services,
              color: Colors.grey,
            ),
          ],
        ),
      ),*/

    /*Container(
      //card doctor
      height: 80.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.2),
        // borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /*SizedBox(
                  width: 10.0,
                ),*/
          CircleAvatar(
            child: Image.asset('images/patients.png'),
            foregroundColor: Colors.grey,
          ),
          Text(
            "Amjad Adil",
            style: TextStyle(color: Colors.grey),
          ),
          Icon(
            Icons.medical_services,
            color: Colors.grey,
          ),
        ],
      ),
    );*/
  }
}
