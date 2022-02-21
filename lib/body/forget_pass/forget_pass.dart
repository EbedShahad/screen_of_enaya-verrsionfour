import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/forget_pass/acount_not_found.dart';
import 'package:screen_of_enaya/body/forget_pass/reset_password.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';

class ForgetPassword extends StatefulWidget {
  //const ForgetPassword({ Key? key }) : super(key: key);
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final forKey = GlobalKey<FormState>();
  bool loading;
  String token;
  final shared = sharingData();
//       var token;
//  @override
// void initState() {
//   token = shared.getinitToken();
//   super.initState();

// }
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: textColor,
        //   ),
        // onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  " forget password ?",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Enter your registerd email to recive password reset  instruction",
                  style: TextStyle(color: mainColor, fontSize: 20),
                  softWrap: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.0,
                width: MediaQuery.of(context).size.width / 0.44,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    //  scale: 10.0,
                    fit: BoxFit.contain,
                    image: AssetImage("images/Login_screen/user_name.png"),
                  ),
                ),
              ),
            ),
            Form(
              key: forKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email, "email"),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Remember password",
                              style: TextStyle(color: mainColor)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainLogin(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.teal,
                        minimumSize: Size.fromHeight(50),
                        // fromHeight use double.infinity as width and 40 is the height
                      ),
                      onPressed: () async {
                        if (forKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          if (loading = true) {
                            token = await createToken();

                            CheckUserFound(emailController.text);
                            /* Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => restPass(),
                               ),
                             );*/
                          }
                        }
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CheckUserFound(String userName) async {
    print("user sssssssssssssssssssssss");

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
//       var request = http.MultipartRequest('GET', Uri.parse('https://waaasil.com/care/api/forget-password'));
// request.fields.addAll({
//    'userName':userName,
// });
    var queryParameters = {
      'userName': userName,
    };
    var uri = Uri.https(
        'www.waaasil.com', '/care/api/forget-password', queryParameters);
    var response1 = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // var response1 = await http.get(
    //   Uri.parse(
    //       "https://waaasil.com/care/api/forget-password", queryParameters),
    //   headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    // );

    // request.headers.addAll(headers);

    //  http.StreamedResponse response = await request.send();
    print(response1.statusCode);

    if (response1.statusCode == 200) {
      var jsonResponse = await json.decode(response1.body);
      print(jsonResponse);
      switch (jsonResponse["code"]) {
        case 200:
          print("user found ya shahad");
          // shared.addUserid(jsonResponse["userId"]["id"]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPass(),
            ),
          );
          break;
        case 500:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AcountNotFound(),
            ),
          );
          break;
      }
    } else {
      print(response1.reasonPhrase);
    }
  }
}
