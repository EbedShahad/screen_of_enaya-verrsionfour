// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/doctorProfile/delete/profilemoel.dart';

Future<DocProf> getData() async {
  var id = "202";
  var profileModel;
  try {
    var response =
        await http.get(Uri.parse("http://waaasil.com/care/api/doctors/$id"));
    print("after response");
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      print(response.body);
      print("after body");
      var jsonMap = json.decode(jsonstring);
      profileModel = DocProf.fromJson(jsonMap);
      print("ya shaha" + profileModel);
      // return profileModel;
    }
  } on Exception catch (Exception) {
    return profileModel;
  }
  return profileModel;
}
