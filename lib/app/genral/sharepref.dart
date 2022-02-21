// ignore_for_file: camel_case_types
// user id  , email ,name ,
// usertype 1 for doctor , 2for patients
import 'package:shared_preferences/shared_preferences.dart';
//0968110157
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
  Future<bool> setFirstTimeLaunch({bool firstTime}) async =>
      _presf.setBool('first_launch', firstTime);

  Future<bool> getFirstTimeLaunch() async =>
      _presf.getBool('first_launch') ?? false;

  void adduserStatus(String status) async {
    _presf = await SharedPreferences.getInstance();
    print("user status ");
    print(status);
    _presf.setString('status', status);
    // print(_presf.getString('firstToken'));
    print("status sucess ");
  }
  getUserStatus() async {
    _presf = await SharedPreferences.getInstance();
    print("get user status ");
    print(_presf.getString('status'));
    return _presf?.getString('status') ?? '--';
  }
 
  void initToken(String inittoken) async {
    _presf = await SharedPreferences.getInstance();
   await _presf.setString('firstToken',inittoken);
   print("Token saved in prefs ");
  }
  getinitToken() async {
    _presf =await SharedPreferences.getInstance();
    print("Stinrg token has beeen getaaaaaaaaaaaaaaaaaa ");
    print(_presf.getString('firstToken').length);
    return _presf?.getString('firstToken') ?? '--';
  }
   void refreshToken(String reftoken) async {
    _presf = await SharedPreferences.getInstance();
    print("From shared prefs String inittoken ");
    print(reftoken);
    _presf.setString('refresfToken', reftoken);
    // print(_presf.getString('firstToken'));
    print("First Token created sucess ");
  }
    getrefToken() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg token has beeen get ");
    print(_presf.getString('refresfToken'));
    return _presf?.getString('refresfToken') ?? '--';
  }
   void typeToken(String typetoken) async {
    _presf = await SharedPreferences.getInstance();
    print("From shared prefs String inittoken ");
    print(typetoken);
    _presf.setString('tokenType', typetoken);
  }
  void addUserid(String userid) async {
    _presf = await SharedPreferences.getInstance();
    print("From shared prefs user id ");
    print(userid);
    _presf.setString('userid', userid);
  }
   // Future<String> getUserid() async {
     getUserid() async {
    _presf = await SharedPreferences.getInstance();
    return _presf?.getString('userid') ?? '--';
  }
  void addPatientName(String patientName) async {
    _presf = await SharedPreferences.getInstance();
    print("patient name share");
    print(patientName);
    _presf.setString('patient_name', patientName);
  }
   // Future<String> getUserid() async {
     getPatientName() async {
    _presf = await SharedPreferences.getInstance();
    return _presf?.getString('patient_name') ?? '--';
  }

  // Future<String> getUserid() async {
  //   return _presf.getString('doctor_name');
  // }
void addRoleId(String role) async {
    _presf = await SharedPreferences.getInstance();
    print("From role id share ");
    print(role);
    _presf.setString('role_id', role);
    // print(_presf.getString('firstToken'));
    print("role  sucess ");
  }
  getRoleID() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg token has beeen get ");
    print(_presf.getString('role_id'));
    return _presf?.getString('role_id') ?? '--';
  }
  void addProviderId(String providerid) async {
    _presf = await SharedPreferences.getInstance();
    print("From provider id share ");
    print(providerid);
    _presf.setString('provider_id', providerid);
    // print(_presf.getString('firstToken'));
    print("provider  sucess ");
  }
  getProviderId() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg token has beeen get ");
    print(_presf.getString('provider_id'));
    return _presf?.getString('provider_id') ?? '--';
  }

void addUserName(String name) async {  
    _presf = await SharedPreferences.getInstance();
    print("From provider id share ");
    print(name);
    _presf.setString('doctor_name',name);
    // print(_presf.getString('firstToken'));
    print("provider  sucess ");
  }
    getUserName() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg token has beeen get ");
    print(_presf.getString('doctor_name'));
    return _presf?.getString('doctor_name') ?? '--';
  }
void addDocEmail(String doc_email) async {  
    _presf = await SharedPreferences.getInstance();
    print("From email doctor share ");
    print(doc_email);
    _presf.setString('doctor_email',doc_email);
    // print(_presf.getString('firstToken'));
    print("provider  sucess ");
  }
    getDocEmail() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg token has beeen get ");
    print(_presf.getString('doctor_email'));
    return _presf?.getString('doctor_email') ?? '--';
  }

void addDocPass(String doc_password) async {  
    _presf = await SharedPreferences.getInstance();
    print("From doctor password share ");
    print(doc_password);
    _presf.setString('doctor_password',doc_password);
    // print(_presf.getString('firstToken'));
    print("provider  sucess ");
  }
    getDocPass() async {
    _presf = await SharedPreferences.getInstance();
    print("Stinrg doctor_passworddoctor_password ");
    print(_presf.getString('doctor_password'));
    return _presf?.getString('doctor_password') ?? '--';
  }
  void adduserPhone(String phone) async {
    _presf = await SharedPreferences.getInstance();
    print("user phone ");
    print(phone);
    _presf.setString('phone', phone);
    // print(_presf.getString('firstToken'));
    print("status sucess ");
  }
  getUserPhone() async {
    _presf = await SharedPreferences.getInstance();
    print("get user phone ");
    print(_presf.getString('phone'));
    return _presf?.getString('phone') ?? '--';
  }
  

  // void addDocName(String doctorName) async {
  //   _presf.setString('doctor_name', doctorName);
  // }

  // void addEmail(String email) async {
  //   _presf.setString('email', email);
  // }
  //  grantClient()async{
  //   _presf = await SharedPreferences.getInstance();
  //   print("From shared prefs grant ");
    
  //   _presf.setString('grantClient', "client_credentials");
  //   _presf.setString('idClient', "5");
  //    _presf.setString('secretClient', "5");
    

  // }

//   String getUserToken() => _presf.getString('token');
//  // String getUserName() => _presf.getString('name');
//   String getEmail() => _presf.getString('email');

  // Future<String> getEmail() async {
  //   return await _presf.getString('email');
  // }

  // Future<String> getDocName() async {
  //   return _presf.getString('doctor_name');
  // }
}
