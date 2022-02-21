// ignore_for_file: camel_case_types
// user id  , email ,name ,
// usertype 1 for doctor , 2for patients
import 'package:shared_preferences/shared_preferences.dart';

class sharingData {
  SharedPreferences _presf;

  sharingData() {
    // at the begining of the app to call all the shared prefs values
    Future.microtask(() async {
      _presf = await SharedPreferences.getInstance();
    });
  }
//  Yousif code
//// splash screen to show once
  // Future<bool> setFirstTimeLaunch({bool firstTime}) async =>
  //     _presf.setBool('first_launch', firstTime);

  // Future<bool> getFirstTimeLaunch() async =>
  //     _presf.getBool('first_launch') ?? false;

  void addUserid(String userid) async {
    _presf = await SharedPreferences.getInstance();
    print("From shared prefs user id ");
    print(userid);
    _presf.setString('userid', userid);
  }
    Future<String> getUserid() async {
    _presf = await SharedPreferences.getInstance();
    return _presf?.getString('userid') ?? '--';
  }

  // Future<String> getUserid() async {
  //   return _presf.getString('doctor_name');
  // }



  void addUserToken(String token) async {
    _presf.setString('token', token);
  }

  void addUserName(String name) async {
    _presf.setString('name', name);
  }

  void addDocName(String doctorName) async {
    _presf.setString('doctor_name', doctorName);
  }

  void addEmail(String email) async {
    _presf.setString('email', email);
  }

  String getUserToken() => _presf.getString('token');
  String getUserName() => _presf.getString('name');
  String getEmail() => _presf.getString('email');

  // Future<String> getEmail() async {
  //   return await _presf.getString('email');
  // }

  // Future<String> getDocName() async {
  //   return _presf.getString('doctor_name');
  // }
}
