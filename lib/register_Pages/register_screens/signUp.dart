// hassan create acount
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:screen_of_enaya/genral/sharepref.dart';
import 'package:screen_of_enaya/genral/style_color.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/OTP_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

// ignore: camel_case_types
class _signUpState extends State<signUp> {
  final formKey = GlobalKey<FormState>();
  bool Loading = false;
  dynamic dropkeyValue = '+249';
  String PhoneNum;
  String Password;
  var passwordCOntroller = TextEditingController();
  var PassowrdErrorText;
  var phoneCOntroller = TextEditingController();
  int confermPassword;
  String errorText = null;
  bool passowrdVisability = true;
  bool confirmPassowrdVisability = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  dynamic dropGenderValue = '1';
  bool validatePassowrdStructure(String value) {
    String pattern = r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validatePhoneStructure(String value) {
    String pattern = r'^(?=.*?[0-9]).{10,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  createAcount(String name, String email, String password, String userNotify,
      String otpNum, String gender, String phone, String docType) async {
    var jsonResponse;
    print("hello  from sign in ");
    final shared = sharingData();
    shared.addUserid("300");
    shared.addDocName(name);
    shared.addUserToken("token");
//  /   print(data);
    print("hello  from sign in  after share ");

    Map data = {
      'name': name,
      'email': email,
      'password': password,
      'user_notification': "1234",
      'otp': otpNum,
      'gender_id': gender,
      'user_phone': phone,
      'user_type': docType
    };
    print("before sign link ");

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Await the http get response, then decode the json-formatted responce.
    var response;
    try {
      response = await http.post(Uri.parse("http://waaasil.com/care/api/users"),
          body: data);
      print("after /////////////////////// sign link ");
      print(response.statusCode);
      jsonResponse = json.decode(response.body);
    } on Exception catch (e) {
      // TODO
    }


//======== Sign Up Card Info =======
  }

  @override
  Widget build(BuildContext context) {
    return
     Stack(
       //fit: StackFit.passthrough,
        children: <Widget>[
          Container(
            color:mainColor,
          ),
      
              Scaffold(
      // backgroundColor: mainColor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top:90, left: 5, right: 5),
        child: Container(
          height: double.infinity,
            
                decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(40.0),),
          //  color:mainColor

  
          child: SingleChildScrollView(
                child: Container(
                  // color: Colors.white38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          // Image(
                          //   image: AssetImage(
                          //       'images/welcome_screen/welcome2.png'),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (value) =>
                                                value.isEmpty || value == null
                                                    ? 'Email'
                                                    : null,
                                            decoration: InputDecoration(
                                                labelText: 'Email',
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                        /*  Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: 1,
                                            )),*/
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: TextFormField(
                                            controller: nameController,
                                            validator: (value) =>
                                                value.isEmpty || value == null
                                                    ? 'Full Name'
                                                    : null,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.teal),
                                                ),
                                                labelText: 'Full Name',
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Gender : "),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors
                                                          .grey.shade400))),
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                underline: SizedBox(),
                                                value: dropGenderValue,
                                                items: [
                                                  DropdownMenuItem(
                                                    child: Text('Male'),
                                                    value: '1',
                                                  ),
                                                  DropdownMenuItem(
                                                    child: Text('Female'),
                                                    value: '2',
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    dropGenderValue = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 23.0),
                                            child: DropdownButton(
                                              value: dropkeyValue,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text('+249'),
                                                  value: '+249',
                                                ),
                                                DropdownMenuItem(
                                                  child: Text('+197'),
                                                  value: '+197',
                                                )
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  dropkeyValue = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ///////////////////////////////////////////////////////////
                                        ////* ========phone Number or Email ======*/
                                        /////////////////////////////////////////////////////////
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                            // keyboardType: TextInputType.phone,
                                            controller: phoneCOntroller,
                                            onChanged: (value) {
                                              PhoneNum = value;
                                            },
                                            validator: (value) {
                                              if (value.isEmpty ||
                                                  value == null) {
                                                return "Required";
                                              } else {
                                                if (!validatePhoneStructure(
                                                    value)) {
                                                  return 'Enter Phone number';
                                                } else {
                                                  return null;
                                                }
                                              }
                                            },
                                            decoration: InputDecoration(
                                                labelText: 'Phone Number',
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ///////////////////////////////////////////////////////////
                                    ////* ========password ======*/
                                    /////////////////////////////////////////////////////////
                                    TextFormField(
                                      controller: passwordCOntroller,
                                      onChanged: (value) {
                                        value = Password.toString();
                                      },
                                      validator: (value) => value.isEmpty ||
                                              value == null ||
                                              !validatePassowrdStructure(
                                                  passwordCOntroller.text)
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
                                    ),
                                    TextFormField(
                                      obscureText: confirmPassowrdVisability,
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            value == null ||
                                            value != passwordCOntroller.text) {
                                          return 'ppassword not match';
                                        } else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                Icons.remove_red_eye_outlined),
                                            onPressed: () {
                                              setState(() {
                                                confirmPassowrdVisability
                                                    ? confirmPassowrdVisability =
                                                        false
                                                    : confirmPassowrdVisability =
                                                        true;
                                              });
                                            },
                                          ),
                                          errorText: errorText,
                                          labelText: 'Confirm Password',
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ///////////////////////////////////////////////////////////////////
                                    //*========================== sign Up button =====*/
                                    ///////////////////////////////////////////////////////////////////
                                    MaterialButton(
                                      color: mainColor,
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        print("pressed");
                                        if (formKey.currentState.validate()) {
                                          setState(() {
                                            // Loading = true;
                                          });
                                          var data = await createAcount(
                                              nameController.text,
                                              emailController.text,
                                              passwordCOntroller.text,
                                              "123",
                                              "4321",
                                              "1",
                                              phoneCOntroller.text,
                                              "1");
                                          /* register signupclass = register();
                                            var data = await signupclass.signUp(
                                                nameController.text,
                                                emailController.text,
                                                phoneCOntroller.text,
                                                passwordCOntroller.text,
                                                dropGenderValue);*/
                                          //     print(data);
                                          /////////////////
                                          ////*shahad touch
                                          ///if (data is int )
                                          // if (data.data =="200") {
                                          //store data in localStorage
                                          //    print("pressed 200");
                                          // SharedPreferences prefs = await SharedPreferences.getInstance();

                                          // prefs.setInt('userId', data);
                                          //goto to otp page
                                          /*    Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OTP_Page()));
                                          } else {
                                            setState(() {
                                              Loading = false;
                                              final snackBar = SnackBar(
                                                  content: Text(
                                                      'this user already exist'));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            });
                                            print('error');
                                          }*/
                                          // ============  OTP Message ===============

                                          //     9999, dropkeyValue);
                                        }
                                      },
                                    ),
                                  ],
                                ),
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
      ),),
            
           
        ],
    );
  }
}
