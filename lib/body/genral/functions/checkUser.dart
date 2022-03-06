import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
//to check user status each period of time 
class UserStatus{

final box = GetStorage();
String token ;
UserStatus(){
token =box.read('token1');
}

  CheckUserStatus() async {
    var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer $token'
};
var request = http.Request('GET', Uri.parse('https://waaasil.com/care/api/checkUserStatus?user_id=1'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

  }
}