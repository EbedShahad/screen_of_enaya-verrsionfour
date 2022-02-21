import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';


class UserReset extends StatefulWidget {
  // const UserReset({Key key}) : super(key: key);
  @override
  State<UserReset> createState() => _UserResetState();
}

class _UserResetState extends State<UserReset> {
  TextEditingController emailController = TextEditingController();
  String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                ListTile(
                  leading: Icon(Icons.verified_user_sharp, color: Colors.teal),
                  title: Text("Please enter your email"),
                ),
                // Text("please enter your email or mobile phone"),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) =>
                        value.isEmpty || value == null ? 'Email' : null,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    IsUserExist(emailController.text);
                  },
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Reset Password"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  IsUserExist(String email) async {
    var response;
    final shared = sharingData();
    var jsonResponse;
    Map data = {
      'userName': email,
    };
    try {
      response = await http.post(
          Uri.parse("http://waaasil.com/care/api/ForgetPassword?="),
          body: data);
      print("after /////////////////////// sign link ");
      print(response.statusCode);
      jsonResponse = json.decode(response.body);
      print(jsonResponse.toString());
      print(jsonResponse["code"]);
      // print(jsonResponse["error"]);
      // print(jsonResponse["data"]);
      // print(jsonResponse["data"]);
      if (jsonResponse["code"] == 200) {
        // shared.addUserid(jsonResponse["userId"].toString());
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (BuildContext context) => ResetPass()),
        //     (Route<dynamic> route) => false);
      } else {
        final snackBar = SnackBar(content: Text(jsonResponse["error"]));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on Exception catch (e) {
      // TODO
      print(e.toString());
    }

    // var request = http.MultipartRequest(
    //     'POST', Uri.parse('http://waaasil.com/care/api/ForgetPassword?='));
    // request.fields.addAll({'userName': email});

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());

    //   print("this is result");
    //   print(response["code"]);
    // } else {
    //   print(response.reasonPhrase);
    // }
    //  userName
    // try {
    //   response = await http.post(
    //       Uri.parse("http://waaasil.com/care/api/ForgetPassword"),
    //       body: data);
    //   print("after /////////////////////// sign link ");
    //   print(response.statusCode);
    //   jsonResponse = json.decode(response.body);
    //   print(jsonResponse.toString());
    // } on Exception catch (e) {
    //   // TODO
    //   print(e.toString());
    // }
  }
}
//http://waaasil.com/care/api/ForgetPassword