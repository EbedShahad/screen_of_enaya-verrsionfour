import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/examiner_part/models/examnerInfo.dart';


// ignore: camel_case_types
class Examener_manger {
  String token = coldToken();
  String fileNumber;
   @override
  void initState() { 
    print("Pass Api");
  //  token= createPasswordToken();
  }
  Future<AllExams> getNews() async {
    
    var client = http.Client();
    var _patientModel;
      final shared = sharingData();
  // var token = await shared.getinitToken();
   

    try {
//       var queryParameters = {
//   'file_number': fileNumber,
  
// };
var uri =
    Uri.https('www.waaasil.com','/care/api/all-examination');
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });
    
        print(response.headers);
        print(response.statusCode);
        print(response.reasonPhrase);
        print(response.body);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        _patientModel = AllExams.fromJson(jsonMap);
      }
    } catch (Exception) {
      return _patientModel;
    }

    return _patientModel;
  }
}
