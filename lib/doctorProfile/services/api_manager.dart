import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:screen_of_enaya/doctorProfile/constants/strings.dart';
import 'package:screen_of_enaya/doctorProfile/models/newsInfo.dart';
import 'package:screen_of_enaya/doctorProfile/models/saveProfile.dart';

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
/*
 */

    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }

  /* Future<ProfileSaved> SaveData(String) async {
    final url = Uri.parse('http://waaasil.com/care/api/doctors/262');
    //final headers = {"Content-type": "application/json"};
    final json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await put(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
      //return response.body;
  }
*/
}
