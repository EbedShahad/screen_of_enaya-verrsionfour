// hassan create acount
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:screen_of_enaya/app/genral/api_url.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/app/token/token_deal.dart';
import 'package:screen_of_enaya/doctorProfile/pages/new_p/new_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// ignore: camel_case_types
class _SignUpState extends State<SignUp> {
  static var token;
  @override
//   void initState() {
// createToken();
//     super.initState();

//   }
  // Toke toke ;
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
  String _mySelection = "1";

  // final String url = "http://webmyls.com/php/getdata.php";

  // List data =List();

  // Future<String> getSWData() async {
  //   final shared = sharingData();
  //   token = await shared.getinitToken();
  //   print("inside Role id ");
  //     var res  = await http.get(
  //       Uri.parse("https://waaasil.com/care/api/all-roles"),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       });
  //       print(res.reasonPhrase);
  //   // var res = await http
  //   //     .get(Uri(path: "https://waaasil.com/care/api/all-roles"), headers: {
  //   //   'Accept': 'application/json',
  //   //   'Authorization': 'Bearer $token'
  //   // });
  //   var resBody = json.decode(res.body);

  //   setState(() {
  //     data = resBody.map();
  //   });

  //   print(resBody);

  //   return "Sucess";
  // }

  bool validatePassowrdStructure(String value) {
    String pattern = r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validatePhoneStructure(String value) {
    String pattern = r'^(?=.*?[0-9]).{9,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void initState() {
    super.initState();
    // this.getSWData();
  }

  @override
  NewUser(String name, String email, String phone, String password,
      String gender, String role) async {
    /**
         * here we must save in shared prefs 
   "role_id": "3"
"user_id": 20,
"id": 14
*****************************

         */
    final shared = sharingData();
    token = await shared.getinitToken();
    print("inside login Signup");
    Map data1 = {
      'name': name,
      'password': password,
      'email': email,
      'gender_id': '1',
      'role_id': '1',
      'user_phone': phone
    };

    print(" token will be printed $token");
    //done
    var response1 = await http.post(
        Uri.parse("https://waaasil.com/care/api/new-provider"),
        body: data1,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response1.statusCode == 200) {
      print(response1.body);
      var jsonResponse = await json.decode(response1.body);
      switch (jsonResponse["code"]) {
        case 200:
          print("user found ya shahad");
          shared.addUserid(
              jsonResponse["data"]["provider"]["user_id"].toString());
          shared
              .addProviderId(jsonResponse["data"]["provider"]["id"].toString());
          shared.addRoleId(
              jsonResponse["data"]["provider"]["role_id"].toString());
          shared.addDocEmail(email);
          shared.addDocPass(password);
          createPasswordToken();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CompProf(
                  //  allStates:jsonResponse["data"]["provider"]["state"],
                  ),
            ),
          );
          break;
        case 500:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('This user Already exist'),
          ));
          print("user found la la la  shahad");
          break;
      }
    } else {
      print(response1.reasonPhrase);
    }
    print("hello  from sign in  after share ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 5, right: 5, bottom: 5),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
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
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: TextFormField(
                                          controller: emailController,
                                          validator: (value) =>
                                              value.isEmpty || value == null
                                                  ? 'Email'
                                                  : null,
                                          decoration: buildInputDecoration(
                                              Icons.email, 'Email'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: TextFormField(
                                          controller: nameController,
                                          validator: (value) =>
                                              value.isEmpty || value == null
                                                  ? 'Full Name'
                                                  : null,
                                          decoration: buildInputDecoration(
                                              Icons.person, 'Full Name'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Role : "),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade400))),
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            underline: SizedBox(),
                                            value: _mySelection,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text('Doctor'),
                                                value: '1',
                                              ),
                                              DropdownMenuItem(
                                                child: Text('Pharmacist'),
                                                value: '2',
                                              ),
                                               DropdownMenuItem(
                                                child: Text('labotry'),
                                                value: '3',
                                              ),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _mySelection = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    // DropdownButton(
                                    //   items: data.map((item) {
                                    //     return new DropdownMenuItem(
                                    //       child: new Text(item['data']['name']),
                                    //       value: item['data']['id'].toString(),
                                    //     );
                                    //   }).toList(),
                                    //   onChanged: (newVal) {
                                    //     setState(() {
                                    //       _mySelection = newVal;
                                    //     });
                                    //   },
                                    //   value: _mySelection,
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Gender : "),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade400))),
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

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 23.0),
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
                                          maxLength: 9,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
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
                                          decoration: buildInputDecoration(
                                              Icons.phone, 'Phone Number'),
                                          //  InputDecoration(
                                          //     labelText: 'Phone Number',
                                          //     labelStyle: TextStyle(
                                          //       color: Colors.grey,
                                          //     ),),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      hintText: "Enter Password",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: mainColor,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: mainColor, width: 1.5),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: mainColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: mainColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: mainColor,
                                        ),
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
                                      hintText: "Enter Password",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: mainColor,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: mainColor, width: 1.5),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: mainColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: mainColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon:
                                            Icon(Icons.remove_red_eye_outlined),
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
                                        NewUser(
                                            nameController.text,
                                            emailController.text,
                                            phoneCOntroller.text,
                                            passwordCOntroller.text,
                                            dropkeyValue,
                                            _mySelection);
                                      }
                                    }),
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
        // ),],
      ),
    );
  }
}
