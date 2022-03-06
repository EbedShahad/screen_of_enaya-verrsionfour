import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/models/prescriptionInfo.dart';


// ignore: camel_case_types
class Presc_Manger {
  String token ;
  String fileNumber;
 
final box = GetStorage();
 Presc_Manger(){
   createPasswordToken();
   token = box.read('token2');
 }
  Future<AllPrescription> getNews() async {

    var _patientModel;

   

    try {
print("enter");
var uri =
    Uri.https('www.waaasil.com','/care/api/all-prescriptions');
  
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });

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
