import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';

const String gId = "5";
const String gSecret = "yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X";
final shared = sharingData();

createToken() async {
  String gType = "client_credentials";
  var headers = {'Accept': 'application/json'};
  Map data1 = {'grant_type': gType, 'client_id': gId, 'client_secret': gSecret};
  var response1 = await http.post(
      Uri.parse("https://waaasil.com/care/api/oauth/token"),
      body: data1,
      headers: headers);
  if (response1.statusCode == 200) {
    print(response1.body);
    var jsonResponse = await json.decode(response1.body);
    print("Token type ");
    print(jsonResponse["token_type"]);
    print(jsonResponse["access_token"]);
    shared.initToken(jsonResponse["access_token"]);
    //token = jsonResponse["access_token"];
  } else {
    print(response1.reasonPhrase);
  }
}

createPasswordToken() async {
  String userName = "doc1234@gmail.comm";
  //shared.getDocEmail();
  String password = "doc@12345";
  //shared.getDocPass();
  var response1 = await http
      .post(Uri.parse('https://waaasil.com/care/api/oauth/token'), body: {
    'grant_type': 'password',
    'client_id': '5',
    'client_secret': 'yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X',
    'username': userName,
    'password': password
  });
  if (response1.statusCode == 200) {
    print(response1.body);
    var jsonResponse = await json.decode(response1.body);
    print("Token type ");
    print(jsonResponse["token_type"]);
    print(jsonResponse["access_token"]);
    shared.initToken(jsonResponse["access_token"]);
    shared.refreshToken(jsonResponse["refresh_token"]);
    //token = jsonResponse["access_token"];
    print("pass token created ");
  } else {
    print(response1.reasonPhrase);
  }
}

refreshToken() async {
  String gType = "refresh_token";
String refToken =shared.getrefToken();
  var headers = {'Accept': 'application/json'};
  Map data1 = {'grant_type': gType, 'client_id': gId, 'client_secret': gSecret,'refresh_token':refToken};
  var response1 = await http.post(
      Uri.parse("https://waaasil.com/care/api/oauth/token"),
      body: data1,
      headers: headers);
  if (response1.statusCode == 200) {
    print(response1.body);
    var jsonResponse = await json.decode(response1.body);
    print("Token type ");
    print(jsonResponse["token_type"]);
    print(jsonResponse["access_token"]);
    shared.initToken(jsonResponse["access_token"]);
    //token = jsonResponse["access_token"];
  } else {
    print(response1.reasonPhrase);
  }
}
