import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/register_Pages/register_screens/OTP_Page.dart';
import 'package:screen_of_enaya/body/forget_pass/reset_password.dart';


class resetPhone extends StatefulWidget {
  //const resetPhone({ Key? key }) : super(key: key);

  @override
  _resetPhoneState createState() => _resetPhoneState();
}

class _resetPhoneState extends State<resetPhone> {
  bool validatePhoneStructure(String value) {
    String pattern = r'^(?=.*?[0-9]).{10,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  final formKey = GlobalKey<FormState>();
  bool Loading;
  String PhoneNum;
  TextEditingController phoneCOntroller = TextEditingController();
  dynamic dropkeyValue = '+249';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    scale: 300.0,
                    fit: BoxFit.contain,
                    image: AssetImage("images/resetPhone.png"),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              " Enter new phone",
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23.0),
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
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      // keyboardType: TextInputType.phone,
                      controller: phoneCOntroller,
                      onChanged: (value) {
                        PhoneNum = value;
                      },
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "Required";
                        } else {
                          if (!validatePhoneStructure(value)) {
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
                ),
              ],
            ),
          ),
          MaterialButton(
            color: Colors.teal,
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
                  Loading = true;
                });
              }
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => OTP_Page()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

  ConfirmPhone(String phone) async {
    var response;
    var jsonResponse;
    Map data = {'userId': '300', 'userPhoned': phone};
    try {
      response = await http.post(
          Uri.parse("http://waaasil.com/care/api/ResetPhone"),
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
            MaterialPageRoute(builder: (BuildContext context) => ResetPass()),
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
