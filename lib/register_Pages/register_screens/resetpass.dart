import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/genral/sharepref.dart';
import 'package:sizer/sizer.dart';
import 'package:screen_of_enaya/main.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/styleApp.dart';

class restPass extends StatefulWidget {
  @override
  _restPassState createState() => _restPassState();
}

class _restPassState extends State<restPass> {
  final forKey = GlobalKey<FormState>();
  bool loading;
  String Password;
  String pass1, pass2;
  String erorText1, errorText2;
  var PassowrdErrorText;
  bool matching;
  TextEditingController passController = TextEditingController();

  TextEditingController resetPassController = TextEditingController();
  bool passowrdVisability = true;
  bool confirmVisability = true;
  bool validatePassowrdStructure(String value) {
    String pattern = r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String confirmedPass;
  sharingData shareprefs = sharingData();
  // Future<String> userid = shareprefs.getUserid();
  var userid;

  @override
  Widget build(BuildContext context) {
    shareprefs.getUserid().then((value) {
      print(value);
      userid = value;
    });
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Care ",
            style: TextStyle(color: Colors.teal),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 10.0,
                    fit: BoxFit.contain,
                    image: AssetImage("images/resetpass.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
              child: Text(
                " Re set password",
                style: TextStyle(color: Colors.teal, fontSize: 20),
              ),
            ),
            Form(
              key: forKey,
              child: Column(
                children: [
                  /*  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  TextFormField(
                                    controller: passController,
                                    onChanged: (value) {
                                      value = Password.toString();
                                    },
                                    validator: (value) => value.isEmpty ||
                                            value == null ||
                                            !validatePassowrdStructure(
                                                passController.text)
                                        ? 'password should contains at \n leats 8 characters \n at least 1 sign'
                                        : null,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye_outlined),
                                          onPressed: () {
                                            setState(() {
                                              passowrdVisability
                                                  ? passowrdVisability = false
                                                  : passowrdVisability = true;
                                            });
                                          },
                                        ),
                                        errorText: PassowrdErrorText,
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        )),
                                    obscureText: passowrdVisability,
                                                        onSaved: (String value){
                     pass1= value;
                    },
                                  ),
                                    ),*/
                  //new pass
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: passController,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (value) => value.isEmpty ||
                              value == null ||
                              !validatePassowrdStructure(passController.text)
                          ? 'password should contains at \n leats 8 characters \n at least 1 sign'
                          : null,
                      // },
                    ),
                  ),
///////////////////////////////////////////////////////////
//* =======================password ======*/
/////////////////////////////////////////////////////////
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: resetPassController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (value) {
                        if (value.isEmpty ||
                            value == null ||
                            passController.text != resetPassController.text) {
                          return 'Password does not match';
                        }
                        print(passController.text);
                        print(resetPassController.text);
                        if (passController.text == resetPassController.text) {
                          matching = true;
                          confirmedPass = passController.text;
                        } else {
                          matching = false;
                        }
                        return null;
                      },
                    ),
                  ),
                  /* Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: resetPassController,
                                                           validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(passController.text);
                      print(resetPassController.text);
                      if(passController.text!=resetPassController.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                                        decoration: InputDecoration(
                                           suffixIcon: IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye_outlined),
                                          onPressed: () {
                                            setState(() {
                                              confirmVisability
                                                  ? confirmVisability = false
                                                  : confirmVisability = true;
                                            });
                                          },
                                        ),
                                        
                                          /*  prefixIcon: Icon(
                                              Icons.security,
                                            ),*/
                                            labelText: 're - Enter Passowrd',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            ),
                                            
                                            
                                            
                                                                onSaved: (String value){
                      pass2 = value;
                    },
                    
                                      ),
                                    ),
                                   
                                   */
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
///////////////////////////////////////////////////////////////////
//*========================== Confirm button =====*/
///////////////////////////////////////////////////////////////////
                    child: RaisedButton(
                        color: Colors.teal,
                        child: Text(
                          'Confirm ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (forKey.currentState.validate()) {
                            setState(() {
                              loading = true;

                              // shareprefs.getUserid().then((value) {
                              //   userid = value;
                              // });
                            });
                            if (matching = true) {
                              ConfirmPass(confirmedPass);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MyHomePage(
                              //       selectedPage: 1,
                              //     ),
                              //

                            }
                            // );
                          }
                        }),
                  ),
                  /* GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyHomePage()));
                                      },
                                      child: Container(
                                        child: Text(
                                          'Creat New Account?',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Color(0xFF252B39),
                                          ),
                                        ),
                                      ),
                                    ),*/
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ConfirmPass(String pass) async {
    var response;
    // sharingData shareprefs = sharingData();
    // // Future<String> userid = shareprefs.getUserid();
    // var userid;

    // shareprefs.getUserid().then((value) {
    //   userid = value;
    // });
    var jsonResponse;
    //  print(userid);
    Map data = {
      'userId': '300',
      'password': pass,
    };
    try {
      response = await http.post(
          Uri.parse("http://waaasil.com/care/api/changePassword"),
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
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => restPass()),
            (Route<dynamic> route) => false);
      } else {
        final snackBar = SnackBar(content: Text(jsonResponse["error"]));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on Exception catch (e) {
      // TODO
      print(e.toString());
    }
  }
}
