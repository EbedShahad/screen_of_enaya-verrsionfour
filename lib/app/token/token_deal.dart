// import 'package:http/http.dart' as http;
// import 'package:screen_of_enaya/app/genral/sharepref.dart';
// class Toke {
//   String gType = "client_credentials";
//   String gId = "5";
//   String gSecret= "yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X";
//  CreateToken() async {
//    var headers = {
//   'Accept': 'application/json'
// };
// var request = http.MultipartRequest('POST', Uri.parse('https://waaasil.com/care/api/oauth/token'));
// request.fields.addAll({
//   'grant_type':gType,
//   'client_id':gId,
//   'client_secret': gSecret
// });

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// // else {
//     print("token");
//   print(response.reasonPhrase);
// }

//  }  
// CreatePasswordToken() async {
//     final shared = sharingData();
//    String userName= await shared.getDocEmail();
//     String password= await shared.getDocPass();
//   // var token = await shared.getinitToken();
//   var request = http.MultipartRequest('POST', Uri.parse('https://waaasil.com/care/api/oauth/token'));
// request.fields.addAll({
//   'grant_type': 'password',
//   'client_id': ' 5',
//   'client_secret': 'yCJSCiB01feAIvLiq9LkFQCrKfhPjjja0dGoXA5X',
//   'username': 'doc1234@gmail.comm',
//   'password\n': 'doc@12345'
// });


// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

// }



// }
 