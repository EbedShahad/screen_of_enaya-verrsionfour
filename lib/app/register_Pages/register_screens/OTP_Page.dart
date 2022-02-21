import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/doctorProfile/pages/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class OTP_Page extends StatefulWidget {
  @override
  _OTP_PageState createState() => _OTP_PageState();
}

class _OTP_PageState extends State<OTP_Page> {
  sharingData shareprefs = sharingData();
  // String userid(sharingData share) => share.getDocid();

  TextEditingController otpController = TextEditingController();
  String myotp = "4321";

  // sharingData().getUserId();
  @override
  Widget build(BuildContext context) {
    print("code in otp build:-");
    shareprefs.getUserid().then((value) => print(value));
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextField(
            
               cursorColor:mainColor,
            controller: otpController,
            decoration: InputDecoration(hintText: 'Enter Code',
              enabledBorder: UnderlineInputBorder(      
	  borderSide: BorderSide(color: mainColor),   
	  ),  
	  focusedBorder: UnderlineInputBorder(
	  borderSide: BorderSide(color:Colors.black),
	   ),  ),
          ),
        ),
        Material(
          child: MaterialButton(
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
            color:mainColor,
            onPressed: () {
              print("confirm");
              /* Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePage()),
                  (Route<dynamic> route) => false);*/
              setState() async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // userid = prefs.getString('userid');
              }

              // print(userid);
              if (otpController.text == myotp) {
                //   MapScreenState.createAcount();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage()),
                    (Route<dynamic> route) => false);
              } else {}
              // getValue() async {
              //   // SharedPreferences prefs = await SharedPreferences.getInstance();
              //   // var userId = prefs.getInt('userId');
              //   // print('the user id is $userId');

              //   return showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: Text("Alert Message"),
              //         content: Text('userId'),
              //         actions: <Widget>[
              //           new FlatButton(
              //             child: new Text('OK'),
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //             },
              //           )
              //         ],
              //       );
              //     },
              //   );
              // }

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (builder) => Home(currentindex: 0)));
            },
          ),
        )
      ]),
    );
  }
}
