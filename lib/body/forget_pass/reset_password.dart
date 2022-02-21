import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';
import 'package:sizer/sizer.dart';
import 'package:screen_of_enaya/main.dart';
import 'package:screen_of_enaya/styleApp.dart';
import 'package:commons/commons.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  var shared;
  String token;
  @override
  void initState() {
    // createToken();
    // shared = sharingData();
    // token = shared.getinitToken().toString();
    // userid = shared.getUserid().toString();
    // super.initState();
  }

  @override
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
  // bool passowrdVisability = true;
  // bool confirmPassowrdVisability = true;

  @override
  Widget build(BuildContext context) {
    // shareprefs.getUserid().then((value) {
    //   print(value);
    //   userid = value;
    // });
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.0,
                width: MediaQuery.of(context).size.width / 0.44,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    //  scale: 10.0,
                    fit: BoxFit.contain,
                    image: AssetImage("images/Login_screen/reset_pass.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  " Re set password",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: forKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.lock, "Password"),
                        validator: (value) => value.isEmpty ||
                                value == null ||
                                !validatePassowrdStructure(passController.text)
                            ? 'password should contains at \n leats 8 characters \n at least 1 sign'
                            : null,
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: resetPassController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: buildInputDecoration(
                            Icons.lock, "Confirm Password"),
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
                              });
                              if (matching = true) {
                                print("before api");
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
            ),
          ],
        ),
      ),
    );
  }

  ConfirmPass(String pass) async {
    print("inside api");
    // var response;
    // var jsonResponse;
    //  String token;
    //  var shared;
    //   String userid;
String token= await createToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://waaasil.com/care/api/change-password'));
    request.fields.addAll({
      '_method': 'Put',
      'userId': "14",
      'newPassword': pass,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      // shared.addDocPass(pass);
      print(await response.stream.bytesToString());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MainLogin()),
          (Route<dynamic> route) => false);
    } else {
      print(response.reasonPhrase);
    }

    //   Map data = {
    //     'userId': '14',
    //     'password': pass,
    //     '_method':'Put'
    //   };
    //   try {
    //     response = await http.post(
    //         Uri.parse("https://waaasil.com/care/api/change-password"),
    //         headers: {
    // 'Accept': 'application/json',
    // 'Authorization': 'Bearer $token'},
    //         body: data);
    //     print("after ///////////////////////Change passssssssss link ");
    //     print(response.statusCode);
    //     jsonResponse = json.decode(response.body);
    //     print(jsonResponse.toString());
    //     print(jsonResponse["code"]);
    //     if (jsonResponse["code"] == 200) {
    //       shared.addDocPass(pass);
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (BuildContext context) => MainLogin()),
    //           (Route<dynamic> route) => false);
    //     } else {
    //       final snackBar = SnackBar(content: Text(jsonResponse["error"]));
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     }
    //   } on Exception catch (e) {
    //     // TODO
    //     print(e.toString());
    //   }
  }
}
