import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';

// ignore: camel_case_types
class API_Manager {
  @override
  void initState() {
    createPasswordToken();
  }

  Future<AllPatientData> getNews() async {
    var client = http.Client();
    var _patientModel;
    final shared = sharingData();
    var token = await shared.getinitToken();
print("Patient api");
    try {
      var response = await http.get(
          Uri.parse("https://waaasil.com/care/api/doctor-patients"),
          headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNGVhYmQ3MDBhN2VkZGEyOTZmMWY2ZGY0MDUzNjVmZGE4ZDEwNzliMjNkN2VlZTY3MDgwZDhiYjQ0N2IwNGNhNjI5NTk5MzMxZjU2YTA4MWUiLCJpYXQiOjE2NDQ0ODc1MzUuOTY1NDQ1MDQxNjU2NDk0MTQwNjI1LCJuYmYiOjE2NDQ0ODc1MzUuOTY1NDQ2OTQ5MDA1MTI2OTUzMTI1LCJleHAiOjE2NDQ0OTExMzUuOTM4ODE3MDI0MjMwOTU3MDMxMjUsInN1YiI6IjIyIiwic2NvcGVzIjpbXX0.btk7bep2h0PPElaxg41nDW3IiB98dxuKWTbzHdKt-_Fu3x8BcrHalw3GiY0Vb0tozy1HSaV-KdohTbN2lF0UCEMpA_jm-bx9XQ2fDjThiymjXVmngI0jvoCTcZmIl3Jyx9L4Ksxl2FedAChmD0FcnoAj9m5ZdXg3zDHU0ZY7FZLbRXHQxYPDF46Q-q2b0pPemU8LDtlOWtvW_L-ucAHILC99ruEt4GhhDl32U0lrMmYgdknBt6_rIs-98mrD-q9OEKuzvIUTvuuwcmC_IIaoBtMNiWRP6oolJOtGdU_I1Sh1UicBMuku3khaGcnlbTUnUVur8GvlAJcQ_bl1GIHODlZToDSiB1s_2ysy8l6QmciT3byobr2_Rl8U58ktBXJuOBYJx10EGf06F7onMqbT_VL-xOMIkevyFcfnC0iEsV5CjXfEqzt88v9Ifpk4-S9osPqMEky4nlIJgI83xD08IMQYLMRE8yLiY8a2UQ1jwFIaaoKpY7mmaiY8jaUB7ePGOSsfF21wnWzyVZFZ0U8eRfepG6mRo22oEhvXKHKXPHQL8uPJV9OJyKJvgtnix5FVNBVlAueoYu9yCwXtC5AZAm5u-gNTq22jelJN8zkpnNcf1AFRXBNfC1TnoxCzr1hc-5Lzn29t_Fgrxf3gObFbcCPS3BchA_f8aKLHX16WBiM'
          });
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
