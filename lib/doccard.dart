import 'package:flutter/material.dart';
import 'package:screen_of_enaya/Patient/PatientDeatilsMain.dart';

class Doccard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Card(
      // clipBehavior: Clip.hardEdge,
      //color: Colors.grey,
      child:*/
        Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade600, width: 0.3),
        ),
      ),
      //  height: 50.0,
      width: double.infinity,
      //  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            // foregroundColor: Colors.white,
            // radius: 50,
            child: Image(
              color: Colors.white,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
              image: AssetImage('images/profile1.png'),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          TextButton(
            child: Text(
              "Pateient name ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PateintDetils1(),
                ),
              );
            },
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Color(0xFFFD6769),
            child: Image(
                // fit: BoxFit.cover,
                color: Colors.white,
                image: Image.asset(
                  "images/pateientCards/stethoscope.png",
                  fit: BoxFit.cover,
                  width: 25,
                  height: 25,
                ).image),
          ),
        ],
      ),
    );
  }
}
