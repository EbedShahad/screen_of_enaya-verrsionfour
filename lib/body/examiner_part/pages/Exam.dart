import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                    maxLines: null,
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
  var headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMTBkN2I0YzM1NGZlYTVjMjYwYTliMzE1MWQwZDgzMGVjYzdiYmFiODJkMTU3ZTAzNzhmMGE0NDMyYzRkOTE3OWNlNmUxNzFkNzZlYWRiZjUiLCJpYXQiOjE2NDU0NDYxODIuMzYyODA0ODg5Njc4OTU1MDc4MTI1LCJuYmYiOjE2NDU0NDYxODIuMzYyODA3OTg5MTIwNDgzMzk4NDM3NSwiZXhwIjoxNjQ1NDQ5NzgyLjMwMzA2NjAxNTI0MzUzMDI3MzQzNzUsInN1YiI6IjIyIiwic2NvcGVzIjpbXX0.nOXSLkmhATbQDmOzOEvQq8MrutYFHk3QnIgO30xO5yVn6HWuJyvhCo4AfgMc0R26nLn5YoPc1PdgPzxH8TwxGL7TE3m6VEkC7QpGIiiZgmhRHh-o3qlikBl3GrzyqW37ef7_qx-o-1eg7lxorjz7U5_9jSd5kOcVOUmvJa3ic_GDCxDSYizTOOPN7aRfyAUxaonWd3kd8AyjODQpTWxc8P-pS-fxrhe9dAaZ3HdWFXYdC7oMW4FJDUAqSovFzxGd7Muk0CXAAYDOkbsvDMw1NolmShrAzI0FSbFRcl7ViAibO5abu73YvF39eoFXPaxwu3TEu9aKNv3wAarnMZJdz8LlQWkTD1lI-tQdxlDKqu7XrUrXCe7M-6h1uYoIRdzH_IscH4oFo5-TRtpETMNOu8ZYXlohbztfh94Lb4hZKAPQKqdxOm6Kej5t9C_gG8mfUT_PZNb5FLpQGsAqIGQ_RfC8nt-H1t4ZR_DjzpXt2j3E2croK8PZHqVMdKPZGtHdQeYR3uEfm-tKGv7yV-IwXMrvJDZ7HQZ0cMuP-7YNqrdBw8PHMy6Fa5O-feFTsEUysS9pFKssQdxFuA46Y5dlS3VJfRL_eNZc_sWzlF1phE7me4FotyFRrMUMSa1mMJKH4jLy5YZjKUXR52GlseIme-gc_q0x8LM9nVcxf254mx8',
    'Accept': 'application/json'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://waaasil.com/care/api/add-result'));
  request.fields.addAll({
    'date': '2022-2-2',
    'provider_id': '15',
    'patient_id': '11',
    'notes': 'after fasting'
  });
  request.files.add(await http.MultipartFile.fromPath(
      'attach', '/C:/Users/PAVILION/Desktop/Laboratory-tests-results.png'));
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
