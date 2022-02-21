import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';


// ignore: camel_case_types
class API_Manager {
  String token;
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
      var queryParameters = {
  'file_number': fileNumber,
  
};
var uri =
    Uri.https('www.waaasil.com', '/care/api/doctor-patients');
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNGRiOTVkNTRiYWJjY2MxZDRkZWQ2MDZmZjg5NTU4NzcyMzkyNmEyZmVkNDk1NTEwMjY5ZDliYjQzZGQxMTBjMTc2MTM1NjBiZTdiMDI2NmEiLCJpYXQiOjE2NDU0NTA2NDMuMTU5MjgxMDE1Mzk2MTE4MTY0MDYyNSwibmJmIjoxNjQ1NDUwNjQzLjE1OTI4MjkyMjc0NDc1MDk3NjU2MjUsImV4cCI6MTY0NTQ1NDI0My4xNDY3MjgwMzg3ODc4NDE3OTY4NzUsInN1YiI6IjIyIiwic2NvcGVzIjpbXX0.INeKAjToCK9ztf8Jnsk41NdoBtSwlOMwfqls-KQwzgegCKqr7kKQaGdB7VYF1RdFSaflVBG9gaYY5kn0hbK_qvlH8YFCaYTozB57e2vjtseawNd39WojxaM6EDX7SUDcnqCtwHrtHr_S2VSOtOFrnpkISm5C1pmurKzOamfPHoNQC5rhG-hgmoOb11gGh6VJSxMIMN6wpmNJn63vKbIR3JPAgzpC44sBbGKhtVY_NpoUWUFDCNS7yOS5nGhi1E0sfqnaSXNzEZIklYtd3DYx7sCS5x4vyaZEi9nuLkIVv1UwaGW1-pHFsD2AsufRbHEeKRxwVJeRXYIT1pC9nOsv2T4OhOfWmD6cbnqo10MH9hrucwHKAEVU_Mamw0Bp8H6dAjKzorNR-0qZExc5aIzpTK8n7iI2KNOYew0YrkS6M8AypJc3-JI79gcbEhrYWJ57Iw-uvtb1dZwedk7_XM-er9fpmCmfmObyOW4W1O4wX7JZxHeLC-Xxp50F-x8JPAAV3WdsDc-bt6s_8_Hee5_MB0q2G44qhF9kwFPR7SXfQ-6wfzMinpn_3uqeZWb0Tvg9E_CxW9COssJxMUH4jib0z2KYGypWGNaROupgi57vjmzNkvFQPRqEMmkTCthEYjzppdOdj3p6x0ty1K2uadj5OiSy867Vt-5W3S8lqd0WllA',
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
