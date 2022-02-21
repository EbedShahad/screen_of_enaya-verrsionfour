import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/models/prescriptionInfo.dart';


// ignore: camel_case_types
class Presc_Manger {
  String token;
  String fileNumber;
   @override
  void initState() { 
    print("Pass Api");
  //  token= createPasswordToken();
  }
  Future<AllPrescription> getNews() async {
    var client = http.Client();
    var _patientModel;
      final shared = sharingData();
  // var token = await shared.getinitToken();
   

    try {
//       var queryParameters = {
//   'file_number': fileNumber,
  
// };
var uri =
    Uri.https('www.waaasil.com','/care/api/all-prescriptions');
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZTE0MWMwZWYwZjE5NzMxZTExMjQ1ODIwOWY1ZmNhNWNmOTZhZTEwNjk1NGJlMWM1MzIzNmRiNWQ3NDkwMzY0OWUxMjRlNzg3M2MzZWY4MDkiLCJpYXQiOjE2NDU0MzI4OTguMjEzNTc0ODg2MzIyMDIxNDg0Mzc1LCJuYmYiOjE2NDU0MzI4OTguMjEzNTc3OTg1NzYzNTQ5ODA0Njg3NSwiZXhwIjoxNjQ1NDM2NDk4LjIwMTk5Mjk4ODU4NjQyNTc4MTI1LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.EA8UskbxeFylHkap8-z574C-ZPF3xLM2LigTxsQpV5x83QXrbw_quGvmo9hDsUiocHEFxWFwob8Cc53h7F4cfo_sW5Y6WRMNGbX6SLf88mSBhZW9Sn4C37R9A1_s7qtXynVR5xj62-7WmfKR-ro5Bw4cJB53UpxxOl2tpQ_wMLlOxEtp8MfhhsF-5F0UW7LwDw0uKrzEVcE0u8kse_vL1i4jtxevbiWITiA9IYH7vn8e0HK9XiQXIyHudNf9Xrkp-WYf2Svb1__9t4A3mVunAHJ3B6T7XzJIxyM62CZk--qRvSePxzcsYt2yBc7rPRX9RSeFDG5W9T8jvhnYUEax6CgF-nt8j6T7Jt2CYu5TKx0JWBZumSGyTQfn0oxXFDzDNUaurIXNSleBAupsJXSh7HhvH5v2aSSX6GRtpBvlG47BYfEv38DidLb9uSF6xuNkta-J5KsauWL5_arQtl_b1jbD1hDEw6wPUQTrdvuT-GJkYGa0CwYdCQK23hMrejf3JfmZfhODemFvvfuJvkPd5zJlcPXItD7Gyy5CCrlDJdj8QQM_bgCwWIjR2woTFcWHEiGgB-NgYrIjz_ScUfAwFTLQVfAkuvToShP-DshFlxRL6sXKj3a40vCfb_ZmOdz1qTJIspsjFHqZU8CSSIePhxEZ9GqnqrfsS1IE99h6ViE',
        });
    
        print(response.headers);
        print(response.statusCode);
        print(response.reasonPhrase);
        print(response.body);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        _patientModel = AllPrescription.fromJson(jsonMap);
      }
    } catch (Exception) {
      return _patientModel;
    }

    return _patientModel;
  }
}
