import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:screen_of_enaya/register_Pages/sign_model.dart';

/*Class register {

  Future<Empty> signUp(String fullName, String email, String userPhone,
      String password, gender) async {
        var empty = null;
    print(" sign up api ");
    try {
    http.Response response = await http
        .post(Uri.parse('http://waaasil.com/care/api/newUser'), body: {
      'fullName': fullName,
      'email': email,
      'userPhone': userPhone,
      'userNotification': 'asasasa',
      'password': password,
      'genderId': gender,
      'otp': '123',
      'userLevel': 1,
    });
    if (response.statusCode == 200) {
      print("status code  200");
      var Data = await response.body;
      var jsonMap = json.decode(Data);
      empty = Empty.fromJson(jsonMap);
      // return json.decode(Data);
    }}
    catch(Excexption) {
      return empty;

    }

   //print(" sign up api ");
    //print(response.statusCode);
    //var Data = await response.body;

    //return json.decode(Data);
  }

///////////////////////////////////////////////////////
  //*===  log in request =====*/
///////////////////////////////////////////////////////



logIn(String email, pass, String userLevel)  //0String userLevel
       async {
    var jsonResponse = null;
    print("hello  from sign in ");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'userName': email, 'password': pass, 'userLevel': userLevel};
   
    //print(data);
    print("hello  from sign in  after share ");

   
    var response = await http
        .post(Uri.parse("http://waaasil.com/care/api/userLogin"), body: 
       {'userName': email, 'password': pass, 'userLevel': userLevel}
        
        
        );
         print("hello  from sign in  after response ");
   // print(response);
    if (response.statusCode == 200) {
      print("hello   200  ");
      jsonResponse = json.decode(response.body);
      print(response.body);
       print("best print");
       if (jsonResponse['code'] == 200)
{
  print("jsonResponse != null");
  print(jsonResponse);
    setState(() {
           print("hello   response.. data   ");
          _isLoading = false;
        });
        //sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => sha()),
            (Route<dynamic> route) => false);
            print("the last  ");
}

      
     
   
     else {
      print("50000");
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
/**
 * =>   fullName
 => email
=>  userPhone
 => userNotification
 => password (edited) 
8:44
=>genderId
8:45
=> otp
 */
*/
