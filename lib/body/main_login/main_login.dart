//login with hassan
// login screen
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/genral/stringss.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/create_acount/signUp.dart';
import 'package:screen_of_enaya/body/examiner_part/pages/HomeExamner.dart';
import 'package:screen_of_enaya/body/forget_pass/forget_pass.dart';
import 'package:screen_of_enaya/body/forget_pass/reset_password.dart';
import 'package:screen_of_enaya/body/main_login/inactive_stauts.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/pages/HomePatient.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/pages/HomePrescripton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLogin extends StatefulWidget {
  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  var shared;
  String token;
  @override
  void initState() {
    createToken();
    super.initState();
  }

  // ignore: non_constant_identifier_names

  bool loading = false;
  // final fieldkey1 = GlobalKey<FormState>();
  final forKey = GlobalKey<FormState>();
  String erorText1, errorText2;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // bool _isLoading = false;
  Map<dynamic, dynamic> userExit = {'message': 'User does not exist'};

  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Login_screen/main_login.png'),
                fit: BoxFit.fill,
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  // Colors.white,
                  //  Color(0xFF2C3343),
                  mainColor,
                  mainColor
                  //   Colors.teal,
                  // Colors.tealAccent,
                ],
              )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF2C3343),
                            spreadRadius: 2,
                            blurRadius: 20),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(400),
                          bottomLeft: Radius.circular(400))),
                  //circle size from down
                  height: MediaQuery.of(context).size.height / 1.12,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Text("LOGIN",
                              style: TextStyle(
                                fontSize: 50,
                                color: mainColor,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(),
///////////////////////////////////////////////////////////
//* ========phone Number or Email ======*/
/////////////////////////////////////////////////////////
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                //bottom: 10.0
                              ),
                              child: Form(
                                key: forKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        cursorColor: mainColor,
                                        controller: emailController,
                                        validator: (value) =>
                                            value.isEmpty || value == null
                                                ? 'Required'
                                                : null,
                                        decoration: buildInputDecoration(
                                            Icons.person, 'Enter Email '),
                                      ),
                                    ),
///////////////////////////////////////////////////////////
//* =======================password ======*/
/////////////////////////////////////////////////////////
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        cursorColor: mainColor,
                                        obscureText: true,
                                        controller: passwordController,
                                        validator: (value) =>
                                            value.isEmpty || value == null
                                                ? 'Required'
                                                : null,
                                        decoration: buildInputDecoration(
                                            Icons.security, 'Enter Passowrd'),
                                        /*InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.security,
                                            ),
                                            labelText: 'Enter Passowrd',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            ),*/
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // IsUserExist();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgetPassword()));
                                          },
                                          child: Container(
                                            child: Text(
                                              'Forget your password ?',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Color(0xFF252B39),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
///////////////////////////////////////////////////////////////////
//*========================== Login button =====*/
///////////////////////////////////////////////////////////////////
                                      child: MaterialButton(
                                          //color: Color(0xFF2C3343),
                                          shape: Border.all(
                                            style: BorderStyle.solid,
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                          color: mainColor,
                                          child: Text(
                                            'Log In ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () async {
                                            // setState(() async {
                                            //  token =await shared.getinitToken().toString();
                                            // });

                                            //   print(token);

                                            if (forKey.currentState
                                                .validate()) {
                                              //  print("validate");
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                              setState(() {
                                                loading = true;
                                              });
                                              NewUser(emailController.text,
                                                  passwordController.text);
                                            }
                                          }),
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUp()));
                                          },
                                          child: Container(
                                            child: Text(
                                              'Creat New Account?',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //  IsUserExist(){

  //  }

  // ignore: non_constant_identifier_names
  NewUser(String email, String password) async {
    final box = GetStorage();
    print("inside 111111111111111 api");
    token = box.read('token1');
    Map data1 = {'username': email, 'password': password, 'user_type': '1'};
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print("test banan ");
    print(headers['Authorization']);
    var response1 = await http.post(
        Uri.parse("https://waaasil.com/care/api/user-login"),
        body: data1,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    setState(() {
      loading = false;
    });
    if (response1.statusCode == 200) {
      print(response1.body);
      var jsonResponse = await json.decode(response1.body);
      switch (jsonResponse["code"]) {
        case 200:
          box.write('email', email);
          box.write('password', password);
          box.write('name', jsonResponse["data"]["name"]);
          box.write('userId', jsonResponse["data"]["id"]);
          box.write('userPhone', jsonResponse["data"]["user_phone"]);
          box.write('providerId', jsonResponse["data"]["provider"]["id"]);
          box.write('roleId', jsonResponse["data"]["provider"]["role"]["id"]);
          box.write(
              'roleName', jsonResponse["data"]["provider"]["role"]["name"]);
          if (jsonResponse["data"]["image"] == null) {
          } else {
            box.write('userImage', jsonResponse["data"]["image"]);
          }

          if (jsonResponse["data"]["status"].toString() == "1") {
            if (jsonResponse["data"]["provider"]["role_id"].toString() == "1") {
              //doctor role
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePatient()));
            } else if (jsonResponse["data"]["provider"]["role_id"].toString() ==
                "2") {
              //pharmacy
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePrescription()));
            } else if (jsonResponse["data"]["provider"]["role_id"].toString() ==
                "3") {
              //labotry
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeExamner()));
            }
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => InActive()));
          }

          // jsonResponse["data"]["id"]905824277","user_type":"1","image":null,"status":"0","address":null,"gender_id":2,"state_id":null,"email_verified_at":null,
          // here we must text user status to check if he active or not

          break;
        case 500:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonResponse["error"]),
            backgroundColor: Colors.teal,
          ));
          print("user found la la la  shahad");
          break;
      }
    } else {
      print(response1.reasonPhrase);
    }
    print("hello  from sign in  after share ");
  }
}
