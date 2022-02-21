import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/body/examiner_part/models/examnerInfo.dart';


// ignore: camel_case_types
class Examener_manger {
  String token;
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
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZjc3YThmZjc3OWNkNDkwZGEyNTQ4ZjY2ZDk4YjA3ZWViZjFmMzFhMzdkYzRlZjlkYjQ5YmY4ZDg3MDhhMjY1MzkyMzVlY2Q4ZjYwZTVjMTgiLCJpYXQiOjE2NDU0NDk5MjYuMDc0NTEzOTEyMjAwOTI3NzM0Mzc1LCJuYmYiOjE2NDU0NDk5MjYuMDc0NTE2MDU3OTY4MTM5NjQ4NDM3NSwiZXhwIjoxNjQ1NDUzNTI2LjA2MDIzNjkzMDg0NzE2Nzk2ODc1LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.Sje2JNWxuR-D1BG20QHWpSS8B-1B2cwwK-jCJ9k8FYJuQq-eMZpp8WyyVFNNA4nU2Ba4k1Tf0tTms95kXWyugHfEcoh8oOaz1j7rk9poI4xXKiTDPneP906AVkMSNh5yY0n5C3AYJWp4uolgt4rUT_JIeTWfcgHgDAC4NM7QPyEjDpR22s5EysRLgrXyQi-TR-Fpz69-q3gDn0QEm_nxLck9FoWFeH9xwCesSJmw8pgYkBZ7tktMAB7dWGeJtysL6Q2PZquM3pLz2vZP5BKzs73zXve5_jF6O2AJYFYWLNIEaa37RGqoSy8O-Mpht54TIRZKaMAytaKmnEBdY6y5iF7LQAo87ecLIjXXZJOR3yn4cuvH_uGkSDQSf7gJXJqyQEbHe1EmORmqp5TuThMgWY_Om5FoZS5A5h9QpuJAdtjQojc6Hv5DoLxWvN-pvIX043rtD5n8lmqYlausSdoR4Dgz-izwzQeG0xNXdpG1hXFR7z3RUjMrtayf-P6jPjpoSOYNfpgFLVHMc1SkAYhEUfh9J4jEKafJX_R26V7uS7y_Kxd3rQarBiNmnbxoFaX0a7oXgDPM7h1YyuHnBNQKxzot-qvcrZ5fL-h9RUvWTILIUMITlmFvz309tjFerdmCS-VdQLAeXmz6bK4bB1hNCiyoeHFZ5HqnDxP3d8I_3ag',
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
