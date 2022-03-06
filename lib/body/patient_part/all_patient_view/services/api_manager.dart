import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';


// ignore: camel_case_types
class API_Manager {
  String token = coldToken();
  String fileNumber;
   @override
  void initState() { 
    print("Pass Api");
  //  token= createPasswordToken();
  }
  Future<AllPatientData> getNews() async {
    var client = http.Client();
    var _patientModel;
      final shared = sharingData();
  // var token = await shared.getinitToken();
   

    try {
//       var queryParameters = {
//   'file_number': fileNumber,
  
// };
var uri =
    Uri.https('www.waaasil.com', '/care/api/doctor-patients');
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });
    
        print(response.headers);
        print(response.statusCode);
        print(response.reasonPhrase);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        _patientModel = AllPatientData.fromJson(jsonMap);
      }
    } catch (Exception) {
      return _patientModel;
    }

    return _patientModel;
  }
}
