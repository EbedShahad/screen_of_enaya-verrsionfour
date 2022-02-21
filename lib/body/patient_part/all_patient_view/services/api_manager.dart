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
    Uri.https('www.waaasil.com', '/care/api/patient-info', queryParameters);
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiY2Y4MjY0NmU2Mjg1YjM1YjdhNWZlZjI3YTYxMjc3ODdlNjQ1ZTkwZTgxYTk0YmEyZjEzZGEyOTA5ZDgyYzk2YjhjYzE3YWFiOWU4YmUxMDYiLCJpYXQiOjE2NDQ4NzE1ODMuMzg4MTc1OTY0MzU1NDY4NzUsIm5iZiI6MTY0NDg3MTU4My4zODgxNzgxMTAxMjI2ODA2NjQwNjI1LCJleHAiOjE2NDQ4NzUxODMuMzY5MzQ5OTU2NTEyNDUxMTcxODc1LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.B8eWDWCWaEfOmLbSAaIJShWdGnNaaOBJW33F66YrqIEymFxFoIJgyPE-k-dsWpitct0WE5dS13Em0iVEbj-zuazA0MkUUoCQqUsQ1GTE58ClR2hF_efwHbqPPt-fVxr0hi29DOO-34zjcS7SY_raqyyhiwk7y9WS-OF85xqk17kiKCe2yd6OMCotZ_M-W9uDqBT5Utco5d7iH2aK2iaB3UKzrCYN-x4mTk-9kI9AZmZknN9VM4xcSstkWtDfdrT-2_IE9U1QrnOB70qERo8xwv_pBpRGTS76I0-L7y9UO1nEQCmM1FhIRwAnv3qAiiKuLtkFsZd6X1CM4Dd5BJ5BeeiDWjpD-hX85PRC9bnmx-qpvc3ITX9vhQYcKnamtuJQM31Jz3PSPIxoXlKBcTBIADo0ct_pApxoJi_L0CW4bX7Jau3dhXOjbqxNaE9jyJHxoZ06m6cYwt51aKnGEZvtWFbI7rjpFAXkea7nAjNlLN1L0GxJEtXBXefPtf8DGlAMhmSKFrcHyl8V3x2X5IBThclyNXO4KnsR3qgVj_CoN7eh_nGFPeeWoCLfUNYS70XFG_BiMuHLAzJNd3xYCrSpM7l_ycOkZcEB3R_sggQKSc1vaCNMghMNhWxa0k6Hafu2HO4Z5T9Yz0AqWqZBH7dNqPmAsvIyPwBnxoVv4oXvKiQ',
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
