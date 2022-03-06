import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';

class Exam extends StatelessWidget {
  Exam({Key key}) : super(key: key);
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lab Exams ",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
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
                ),
              ),
            ),
            // Divider(
            //   color: Colors.pink,
            // ),
            Text("Notes : ",
                style: TextStyle(color: Colors.blue, fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Card(
                  child: TextField(
                    controller: note,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                   color: Colors.blue,
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      getPdfAndUpload();
                    }),
              ],
            ),
            Spacer(),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Send Result",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  AddExamResult();
                  // AddExamResult(note.text,files);
                }),
          ],
        ),
      ),
      //floatingActionButton:
    );
  }
}

AddExamResult() async {
  String token =coldToken();

  var headers = {
    'Authorization':
        'Bearer $token',
    'Accept': 'application/json'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://waaasil.com/care/api/add-result'));
  request.fields.addAll({
    'date': '2022-2-23',
    'provider_id': '',
    'patient_id': '31',
    'notes': 'after fasting'
  });
  // request.files.add(await http.MultipartFile.fromPath(
  //     'attach', '/C:/Users/PAVILION/Desktop/Laboratory-tests-results.png'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future getPdfAndUpload() async {
  FilePickerResult result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );

  if (result != null) {
    List<File> files = result.paths.map((path) => File(path)).toList();
  } else {
    // User canceled the picker
  }
}
