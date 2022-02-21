import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:logger/logger.dart';


 createToken() async {
  final shared = sharingData();
  String gType = "client_credentials";
  String gId = "5";
  String gSecret = "yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X";
  var headers = {'Accept': 'application/json'};
  Map data1 = {'grant_type':gType, 'client_id':gId, 'client_secret':gSecret};
  var response1 = await http.post(
      Uri.parse("https://waaasil.com/care/api/oauth/token"),
      body: data1,
      headers: headers);
  if (response1.statusCode == 200) {
    var jsonResponse = await json.decode(response1.body);
   printWrapped(jsonResponse.toString()+" Hello at the end ");
   shared.initToken(jsonResponse["access_token"]);
    print("Length ");
    print(jsonResponse["access_token"].toString().length);
 //  shared.initToken(jsonResponse["access_token"]);
  } else {
    print(response1.reasonPhrase);
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) {
print(match.group(0));
  } );
  print("out from each");
}

 createPasswordToken() async {
   createToken();
   final shared = sharingData();
   print(shared.getinitToken().toString());
   print("doc1234@gmail.comm");
  
  String userName="doc1234@gmail.comm";
  //shared.getDocEmail();
   String password="doc@12345";
   //shared.getDocPass();
  var response1 = await http
      .post(Uri.parse('https://waaasil.com/care/api/oauth/token'), body: {
    'grant_type':'password',
    'client_id':'5',
    'client_secret':'yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X',
    'username': userName,
    'password': password
  });
  debugPrint(json.decode(response1.body).toString());
if (response1.statusCode == 200) {
    print(response1.body);
    var jsonResponse = await json.decode(response1.body);
      // return jsonResponse["access_token"];
    // print("Token type ");
    // print(jsonResponse["token_type"]);
    print("aaaaaaaaaa");
    shared.initToken(jsonResponse["access_token"]);
    shared.refreshToken(jsonResponse["refresh_token"]);
    // //token = jsonResponse["access_token"];
    // //  print("pass token created ");
   
  } else {
    print(response1.reasonPhrase);
  }

}
