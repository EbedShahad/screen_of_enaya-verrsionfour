//login with hassan
// login screen
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/genral/stringss.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/create_acount/signUp.dart';
import 'package:screen_of_enaya/body/forget_pass/forget_pass.dart';
import 'package:screen_of_enaya/body/forget_pass/reset_password.dart';
import 'package:screen_of_enaya/body/main_login/inactive_stauts.dart';
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
  final fieldkey1 = GlobalKey<FormState>();
  @override
  final forKey = GlobalKey<FormState>();
  String erorText1, errorText2;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
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
                          decoration: BoxDecoration(

                              ),
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
                                        validator: (value) {
                                          //  value = erorText1;
                                          if (value.isEmpty || value == null)
                                            erorText1 = 'Required';
                                          // else
                                          //   erorText1 = "";
                                          return erorText1;
                                        },
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
                                              'Forget Password your password ?',
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
                                            setState(() async {
                                             token =await shared.getinitToken().toString();
                                            });
                                            
                                            print(token);
                                            NewUser("AAA","aaaa",token);
                                          

                                            if (forKey.currentState.validate()) {
                                              //  print("validate");
                                              setState(() {
                                                loading = true;
                                              });}
                                            //  try {
                                            //  register login = register();

                                            //  loginApi(
                                            //   emailController.text,
                                            //   passwordController.text,
                                            // );

                                            //sha      print("data dta tat : ");
                                            //sha   print(data.data);
                                            //  intAsJson.text = json.encode(data);
                                            //sha  if (data.data == data)
                                            /*data !=
                                                      'Incorrect Credentials' ||
                                                  data != "User does not exist"*/ //{
                                            //sha  SharedPreferences prefs =
                                            //sha      await SharedPreferences
                                            //sah         .getInstance();
                                            //sha    prefs.setInt('userId', data);
                                            //sha        print("hello ");
                                            //sha            Navigator.pushReplacement(
                                            //sha             context,
                                            //sha         MaterialPageRoute(
//sha builder: (context) =>
                                            //sha          OTP_Page()));
                                            //sha          } else {
                                            //sha        print("hello  elseR");
                                            //sha       setState(() {
                                            //sha       loading = false;
                                            /*     final snackBar = SnackBar(
                                                      content: Text(
                                                          'wrong password or Email'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                });
                                              }
                                            } catch (e) {
                                              print(e);
                                            }*/
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
                                                color: Color(0xFF252B39),
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
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // must delete it
                //       InkWell(onTap: (){
                //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text("jsonResponse[error]"),
                //   backgroundColor: Colors.teal,
                // ));
                //       },
                //         child: Text("kjjjjjjjjjjj",)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //  IsUserExist(){

  //  }

  loginApi(email, pass) async {
    print("banan test ");
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    /* var headers = {
  'Accept':'application/json',
  'Authorization': 'Bearer $token'
};*/
// var headers = {
//   'Accept': 'application/json',
//   'Authorization': 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZjgxYzBhNTY0MmNmYjcxMWZkZWVmYTA4ZmQzMDc2ODgyMGEyMGI3MzkwMTMyYzIzODc4NGZiMWNmNDI0OWMzMGNmZDI0NDEyMGY1OGE3NTciLCJpYXQiOjE2NDQzMjI4NTEuNDUzMzYxOTg4MDY3NjI2OTUzMTI1LCJuYmYiOjE2NDQzMjI4NTEuNDUzMzYzODk1NDE2MjU5NzY1NjI1LCJleHAiOjE2NDQzMjY0NTEuNDQ3NjU1OTE2MjEzOTg5MjU3ODEyNSwic3ViIjoiIiwic2NvcGVzIjpbXX0.fWnJh-mOrySBtxLg6lxIO2gAqLQC9yNFzZFstqWmEgKFMAv6OblHGBkT-gKXr8NtS_FJ02Ine9UruIk62DWGMJLlBH9HcHucIul_uWDpuNFYdhtAIlD0NTYs59QPb8VFe6M1IzgdjMonLxYB5tPChPSS-2rvJnfED3szF1-HHhURwCipho2LYpq8If5WBBtvio--SUcZ-eJZZR5Bv0Zw0-dqxgQzJ5HWrjCdUfRZjhZvwjDEOrn0h9iLKSiC3hIxCAoAFLPXlsSWmMp8t0F4xwfhmS4H0APN9wEkSBsTUvR4sFfwGaKxAtGBAKXKqMEWNRAiyqLdqu-iFBZI0zPyWfAYnbhP-fMPdnQIdOoD-VHhyO_SCYVBG39DHUbJvwfWlXW15EevKXfrBLfbs_iqcn5b02qMYtnbcwnvWzJzPcz6yVodT3a5J0d627IJ-L4vqE2e6VTWko_AyTBoZHIZWkfzegxPLERHW_gX4r5-IJjkwRXnreOfiBhZMNtidNeVKe3stvbKrhmjg0R-oadhfS2ibGR8gmymSUVIguTh5WX7OCxXuWi9ENEmVav1-4wX7ahozXZ0UDGQlJgft7dRaGk32WHdz9JR5aBZsTGYmiqdcwruczvAKmXUwhtlJ4NPlNHPdzOHkDUEE0CE2P1ncuL0U3'
// };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://waaasil.com/care/api/user-login'));
    request.fields.addAll({
      'username': 'doc1234@gmail.com',
      'password': 'doc@12345',
      'user_type': '1'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("you must write the rout");
    } else {
      print(response.reasonPhrase);
    }
  }
////////////////////////////////////////

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("hello  from sign in ");
//     print("login ya  ");
//     var response1 = await http
//         .post(Uri.parse("http://waaasil.com/care/api/userLogin"), headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     }, body: {
//       'username': email,
//       'password': pass,
//       'user_type': '1'
//     }
//             // {'username': email,'password': pass,'user_type': userLevel}
//             );

//     String jsonsDataString = response1.body
//         .toString(); // toString of Response's body is assigned to jsonDataString
//    // var _data = jsonDecode(jsonsDataString);
//     //print(_data.toString());
//     print("DATA123");
//     print(response1.statusCode);
//     var jsonResponse = json.decode(response1.body);
//     print(jsonResponse['code']);
//     if (response1.statusCode == 200)
//     {
//       print(response1.body);
//       if (jsonResponse['code'] == 200) {
//         print("jsonResponse != null");
//         print(jsonResponse);
//         print(jsonResponse['data']['userId']);
//         setState(() {
//           _isLoading = true;
//           print("hello   response.. data   ");
//           prefs.setString(
//               'userId', (jsonResponse['data']['userId']).toString());
//         });
//         // print(prefs.getString('userid'));
//         //sharedPreferences.setString("token", jsonResponse['token']);
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (BuildContext context) => OTP_Page()),
//             (Route<dynamic> route) => false);
//         print("the last  ");
//       } else {
//         // setState(() {
//         //   _isLoading = false;
//         // });
//         final snackBar = SnackBar(
//           content: Text(jsonResponse['error']),
//           backgroundColor: Colors.teal,
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (BuildContext context) => MainLogin()),
//             (Route<dynamic> route) => false);
//       }

//     }
//     else if(response1.statusCode ==401) {
//       print("This ,assage");
// print( jsonResponse['message']);
//     }
//   }
// }
 NewUser(String name, String password, String token) async
   {
    // token =shared.getinitToken().toString();
    // print("inside login login");
    // // token = await createToken();
    // print(await token);
    print("inside 111111111111111 api");

    Map data1 = {
      'username': 'doc1234@gmail.com',
      'password': 'doc@12345',
      'user_type': '1'
    };
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
          'Accept':'application/json',
          'Authorization':'Bearer $token'
        });
    if (response1.statusCode == 200) {
      print(response1.body);
      var jsonResponse = await json.decode(response1.body);
      switch (jsonResponse["code"]) {
        case 200:
          print("user found ya shahad");
          var userid=jsonResponse["data"]["id"];
         // jsonResponse["data"]["id"]
         // here we must text user status to check if he active or not 
          print(userid);
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
