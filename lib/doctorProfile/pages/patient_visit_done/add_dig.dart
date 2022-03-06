//date, discription, patient_id, provider_id, quantity, drug_id

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/doctorProfile/pages/patient_visit_done/complintsModel.dart';

class AddDig extends StatefulWidget {
  AddDig({Key key}) : super(key: key);

  @override
  State<AddDig> createState() => _AddDigState();
}

// date, notes, patient_id, provider_id, tests[]
class _AddDigState extends State<AddDig> {
  // Future<AllCompliants> _patientModel;
  final _formKey = GlobalKey<FormState>();
  void initState() {
    // _patientModel = Compla_manger().getNews();
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  List<Widget> _children = [];

  int _count = 0;

  void _add() {
    _children = List.from(_children)
      ..add(TextFormField(
        decoration: InputDecoration(hintText: "This is TextField ${_count}"),
      ));
    setState(() => ++_count);
  }

//date, notes, patient_id, provider_id, diseases[]
  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    List<bool> _value = [false];
    bool isChecked = false;
    var items = ["Fever", "Dizy", "Heartache","Toothache","pain"];
    String dropdownvalue;
    TextEditingController note = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("P0056"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.attach_file_sharp,
                color: Colors.white,
                size: 20,
              ),
              onPressed: getPdfAndUpload)
        ],
      ),
      drawer: Drawer(),
      body:
          // FutureBuilder<AllCompliants>(
          // future: _patientModel,
          //  builder: (context, snapshot) {
          //    print(snapshot.connectionState.toString());
          //    print(snapshot.data.data[0].name);
          //   if (snapshot.hasData) {
          //     var checkedValue;
          //   return
          SingleChildScrollView(
            child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Expanded(
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Final diagnosis ",
                      style: TextStyle(color: mainColor, fontSize: 20),
                    ),
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage("images/patients/prescription.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formattedDate,
                      style: TextStyle(color: mainColor, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Text("diagnosis :          "),
                      DropdownButton<String>(
                        // Initial Value
                        value:items[0],
          
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
          
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Notes : ",
                          style: TextStyle(color: textColor, fontSize: 30)),
                    ],
                  ),
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
                ],
              ),
            ),
                  ),
                ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),

      /*else
            return Center(
                child: CircularProgressIndicator(
              color: mainColor,
            ));*/
      // },
    );
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

// class Compla_manger {
//   Future<AllCompliants> getNews() async {
//     var client = http.Client();
//     var _patientModel;
//     // final shared = sharingData();
//     // var token = await shared.getinitToken();

//     try {
//       var response = await http.get(
//           Uri.parse(
//               "var request = http.Request('GET', Uri.parse('http://waaasil.com/care/api/all-complaints'));"),
//           headers: {
//             'Accept': 'application/json',
//             'Authorization':
//                 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiYTQzNDc1OWFhZDY4NzNjYTEyNzk4ZDMzYWZlMTFiNGZiZWNhMDczNDM1Y2RjYzUyMWQ0NjJiZmJkMTYwY2FlZDM0OTZkNDE5M2JhYTQ1NTAiLCJpYXQiOjE2NDU0NTY5NjMuNjcxNDgzMDM5ODU1OTU3MDMxMjUsIm5iZiI6MTY0NTQ1Njk2My42NzE0ODQ5NDcyMDQ1ODk4NDM3NSwiZXhwIjoxNjQ1NDYwNTYzLjY1MjEzNDg5NTMyNDcwNzAzMTI1LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.4thm0GahNiPiaBuucF3wkXcHltdRQ_OyW3LaiStusyamI6aw512RyLlUzQpk-8OXoidtzsyXAoAFDxzipTBbEU2OibBdtw0nY4TW-mY0C46ybvQQRM4lYcy-k2b9IGj_4i_RINEzMgdNEDfT3zDFAvtMRDiJBPd7EinxCebKJisMEsMygYagpmJQ4tdrNRc8xD1FwyUBKmwh-t06f2bcoc8PPX-TgOAhitjnaC82ymtJkqoy_Rc9SvDmfUjxpTrNQjrvKLlREmn63yAeAVko0t8bZughKDRCs9Qm3dYQZZhadQEc5A2MShBbkqZen6tZLDi7wjnFgVSTwmboO4cjlhBapRptWGo1vDnm1kE57sp6pfxMlFXhKcwkos8WmjwZbtN5TaVz9L1m0MnmUfbEBdVoJAsM09HS6NLsHCOBXajIGY7E9HHuCZPiFH_TVc2P2kH8kCT-aLT3I67wgUq6qbEo7Jx2AZWFL5YOWz5u6z0m-1tFIBzsoXpHwemvDXjiYrYPuzolQsAE9JI_cOjMDnISci70iD_jOpjIUs5rK8uzg_FrAS3-DAi7bkbghnm9inE46d6fnNLRb9d55LHMSYoWoE4ISYS8HxM79Yb7pfoQJXsT4ABqnsxxRxF2oET4AEAoKKPmlPCvcF46jy9BrdnT8GiOq5mO5AYUZPYHsMw',
//           });
//       print(response.headers);
//       print(response.statusCode);
//       print(response.reasonPhrase);

//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);
//         print(jsonMap);
//         _patientModel = AllCompliants.fromJson(jsonMap);
//         return _patientModel;
//       }
//     } catch (Exception) {
//       return _patientModel;
//     }

//     //return _patientModel;
//   }
// }
