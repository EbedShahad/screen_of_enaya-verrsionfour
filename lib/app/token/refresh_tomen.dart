import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:logger/logger.dart';

coldToken() {
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiYTY1YWE0MDA1MjhjN2I3Y2ViNmUzNjY3NjJlOGU2OTk0ZWE5YTVhN2ExNzk2ZTI3N2JjMmE0ZDRhOGVkMmU0YTliMDUxNzgxZmZjMWE2MTIiLCJpYXQiOjE2NDU1OTkwMjcuMDIyODAwOTIyMzkzNzk4ODI4MTI1LCJuYmYiOjE2NDU1OTkwMjcuMDIyODA0MDIxODM1MzI3MTQ4NDM3NSwiZXhwIjoxNjQ1NjAyNjI3LjAxNDgxMzg5OTk5Mzg5NjQ4NDM3NSwic3ViIjoiMjIiLCJzY29wZXMiOltdfQ.Tg56diE7Jocu2KE-wBK3fbZh50z0n8uKyn4C9PGeeYT9R2hGJCHaQeTj67Tx82qyyJpRhdStySAJtgOM9ByHrXbVkYrPvYcP3Odl9j8XpjxNqH145sWafoigRZS5nu-16IYerXx5md4JDo01FDjuphOr_C9F2WE57b1iDfeePPjhqh9ijIuWQDeENgBF8HF_wkIqbvS9ASaT_uZL17ElAJYwUigYpiYitiJG7IyVbs_CK6pNxlHB3BCc5QUC02gaXhzT1d4I2nEiAZ7Z1l8uzJ2oPdlQ0CUJzG6z-oEOWOMZYZDkxgTOL7LsYPGHqu4NNJjForkmR7uri16gq2VWdVQfSAVBQgtD4O_hdieL5UfR2ay2k4MoKxofThGaSLpDpRN623xLxLl-2xH5LOYj9K2Le0nl9fS8eKC0AFoGy0QnsRoZa_Mwkzk7K1bx_O--an9qwzc_V7fwxCox9ZoD-ZBADDOL5HgCET3tnw5_SvZ7t2YVqRTUVNYi1BKNbl3O-1iikD39IpM-gTwLoU8yK82Kv3qwa0C1eRaULsfkKRmIpmPjJ13_atKNBMTKEZtJ0uUaMVQGHURz4YgDJD-yXVeEl0sc5ky5aji9ARUGZB_RMGuR1jx-ojakLA4LtfvesYLJoq4MgYimfnYGD1rdet-8MsD_GJ9OQyN3LQ9FlAA';
  return token;
}

createToken() async {
  final box = GetStorage();
  String gType = "client_credentials";
  String gId = "5";
  String gSecret = "yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X";
  var headers = {'Accept': 'application/json'};
  Map data1 = {'grant_type': gType, 'client_id': gId, 'client_secret': gSecret};
  var response1 = await http.post(
      Uri.parse("https://waaasil.com/care/api/oauth/token"),
      body: data1,
      headers: headers);
  if (response1.statusCode == 200) {
    var jsonResponse = await json.decode(response1.body);
    box.write('token1', jsonResponse["access_token"]);
  } else {
    print(response1.reasonPhrase);
  }
}

// void printWrapped(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) {
//     print(match.group(0));
//   });
//   print("out from each");
// }

createPasswordToken() async {
  final box = GetStorage();
  String userName = box.read('email');
  String password = box.read('password');
  print(userName);
  //shared.getDocPass();
  var response1 = await http
      .post(Uri.parse('https://waaasil.com/care/api/oauth/token'), body: {
    'grant_type': 'password',
    'client_id': '5',
    'client_secret': 'yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X',
    'username': userName,
    'password': password
  });
  debugPrint(json.decode(response1.body).toString());
  if (response1.statusCode == 200) {
    print(response1.body);
    var jsonResponse = await json.decode(response1.body);
    box.write('token2', jsonResponse["access_token"]);
    box.write('refreshToken', jsonResponse["refresh_token"]);
  } else {
    print(response1.reasonPhrase);
  }
}
