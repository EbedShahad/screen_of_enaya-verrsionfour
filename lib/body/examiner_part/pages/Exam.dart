import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Exam extends StatelessWidget {
   Exam({ Key key }) : super(key: key);
   TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Lab Exams ",style: TextStyle(color: Colors.blue,fontSize: 30),
              ),
            ),
          ),
         
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 200,
             width: 200,
             child: CircleAvatar(
             child: Image.asset("images/Labotry/flask.png"),
           ),),
         ),
          // Divider(
          //   color: Colors.pink,
          // ),
          Text("Notes : ",style: TextStyle(color: Colors.blue,fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Card(
                child: TextField(
                  controller: note,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
              ),
              ),
            ),
          ) 
        ],),
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.blue,
        child: Icon(Icons.attach_file,color: Colors.white,),
        onPressed:() async {
       
        getPdfAndUpload();
        }
      
    ),
      
    );
  }
}
 AddExamResult() async
     {
      var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZjliYzYxYjVlYzVjN2NlYzczMWE0MTM2ZjVhNDE4NWFkNmVlZDg2MmEyYWMzODA3MzEwNTgxMzc5NDNkMzliMTJiNWM3YjQxNDg0N2UwYjYiLCJpYXQiOjE2NDM1OTkwMjYuMzI2ODMzMDA5NzE5ODQ4NjMyODEyNSwibmJmIjoxNjQzNTk5MDI2LjMyNjgzNjEwOTE2MTM3Njk1MzEyNSwiZXhwIjoxNjQzNjAyNjI1Ljk3OTIxODk1OTgwODM0OTYwOTM3NSwic3ViIjoiMjIiLCJzY29wZXMiOltdfQ.jGM7VUWT4FbpTMKYMstuSt30TYaSa94BBIYE8JBCFEXY2QJ4w8p4yU2iC40EEm3fkFXizQEMYLYOMecQlaIWUDO2BY5poooGLdUzlrVK968CVc2PJhFuHNkAycRstXI5ydjK7MowSiaXS8LtPSm_rio3TEFcVP0AtugwthZP1YCY6Iu5L9c6HAOGzxatc_REKxvD2oFheP5weKFRq2Wuc30-Oy8iTkNmwMFjIs789UQaYvx_4o4c7OqqWvLVYUH98ebniSa8O4_rt5tgILxu04Zi1-RXwLkkVJsH64I2o3VEVwWUpYo2mnNGFHmOgnGXYB_SzycKzXg8E4COwh92NoHms-aDsqJxmwqnrjc4AfMWhPehXTVj48v_d9GTNFnscRtDDVj2AfG1439EhgORyavrBKNXfSQVmij-cEHZd2lqhg3xer9jkLGREHyU2p_e7blDL-N_fcZYVj0xvzjobnhbOW4m8ceFcVbsrEIeByCndHE8xK2Uu13wN_O-poz6G_AwFI6wSn_Rtg8PNUC9xYUvFKrLvI921JAx7t59aIJ7o--3c-MsXgQz_nzuj0J8qaQ1EFjHiwGyNHrhSp7VSNWrbxyx-Lh-arH5CKpas-wwEuA3PqRa4hjJXO1lgct1KKy0SzgpV_gkwwam7NGf_nNYFug7YbaOQqc8yK5Yoks'
};
var request = http.MultipartRequest('POST', Uri.parse('https://waaasil.com/care/api/patient-medical-info'));
request.fields.addAll({
  'patient_id': '8',
  'social_history': 'no one',
  'animals': 'cats',
  'drinking': '1',
  'smoking': '1',
  'diseases[]': '1',
  'drugs[]': '1'
});
request.files.add(await http.MultipartFile.fromPath('attach', '/C:/Users/PAVILION/Desktop/271996026_340009198129519_8510656457623799739_n.jpg'));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

      
    }

 Future getPdfAndUpload() async {
 
  FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true,
    type: FileType.custom,
  allowedExtensions: ['jpg', 'pdf', 'doc'],);

if (result != null) {
  List<File> files = result.paths.map((path) => File(path)).toList();
} else {
  // User canceled the picker
}}