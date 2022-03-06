//to add medical information for patient
// i must add req filed with form
//  drugs and disease here must be drop down list 

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/add_new_patient/sub_disease_history.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/models/patientInfo.dart';
import 'package:screen_of_enaya/doctorProfile/pages/patient_visit_done/add_visit.dart';
import 'package:screen_of_enaya/doctorProfile/pages/patient_visit_done/patient_choices.dart';
import 'package:screen_of_enaya/main.dart';
import 'package:file_picker/file_picker.dart';

class PatienMedicalInfo extends StatefulWidget {
  // PatienMedicalInfo({Key key, this.p_name,this.p_file_no, this.p_id}) : super(key: key);
  String p_name;
  String p_file_no;
  String p_id;
  PatienMedicalInfo({Key key, this.p_name, this.p_file_no, this.p_id})
      : super(key: key);
  @override
  State<PatienMedicalInfo> createState() => _PatienMedicalInfoState();
}

TextEditingController animalController = TextEditingController();
TextEditingController socialController = TextEditingController();
TextEditingController historyDrugsController = TextEditingController();
List<TextEditingController> diseaseController = [];
 final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController;

class _PatienMedicalInfoState extends State<PatienMedicalInfo> {
    String _mySelection;

  final String url = "https://waaasil.com/care/api/all-diseases";

  List data = [];
    var dise = [    
    'Fever 1',
    'Dizy',
    'Heartache',
    'Toothache',
    'pain',
  ];
  var druggy = [    
    'Pandol',
    'Antibiotic',
    'penicillin Injection',
    'Cardioflux',
    'Panadole Extra',
  ];
   String dropdownDisse = 'Item 1';
    String dropdownDruggy = 'Item 1';
  String token = coldToken(); //edited line

  Future<String> getSWData() async {
    var res = await http
        .get(Uri(path:url), headers: {"Accept": "application/json",
         'Authorization': 'Bearer $token'});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }
  void initState() {
    super.initState();
    this.getSWData();
  } 
  /**
    * Smoking, drinking,animals, social_history, patient_id,
diseases[], drugs[]
    */
    
  AddMedicalInfo() async {
    String token = coldToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://waaasil.com/care/api/patient-medical-info'));
    request.fields.addAll({
      'patient_id': '8',
      'social_history': 'no one',
      'animals': 'cats',
      'drinking': '1',
      'smoking': '1',
      'diseases[]': '1',
      'drugs[]': '1'
    });
    request.files.add(await http.MultipartFile.fromPath('attach',
        '/C:/Users/PAVILION/Desktop/271996026_340009198129519_8510656457623799739_n.jpg'));
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

  var smoke;
  var drink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical info "),
        backgroundColor: mainColor,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("P0056"),
                //Text(widget.p_file_no),
                leading: Icon(
                  Icons.person,
                  color: mainColor,
                ),
                subtitle: Text(
                  //widget.p_name
                  "ahmed emam"),
              ),
            ),
            Divider(),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Smoking :"),
                  Row(
                    children: [
                      Text("Yes"),
                      Container(
                        child: Radio(
                          value: "Yes",
                          groupValue: smoke,
                          onChanged: (value) {
                            setState(() {
                              smoke = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("No"),
                      Container(
                        child: Radio(
                          value: "No",
                          groupValue: smoke,
                          onChanged: (value) {
                            setState(() {
                              smoke = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Drinking :"),
                  Row(
                    children: [
                      Text("Yes"),
                      Container(
                        child: Radio(
                          value: "Yes",
                          groupValue: drink,
                          onChanged: (value) {
                            setState(() {
                              drink = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("No"),
                      Container(
                        child: Radio(
                          value: "No",
                          groupValue: drink,
                          onChanged: (value) {
                            setState(() {
                              drink = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: animalController,
                validator: (value) =>
                    value.isEmpty || value == null ? 'animal' : null,
                decoration: buildInputDecoration(
                    Icons.home, 'what animals do you have  ?'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                controller: socialController,
                validator: (value) =>
                    value.isEmpty || value == null ? 'Social History' : null,
                decoration: buildInputDecoration(
                    Icons.people, 'what about your social history?'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [ 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" Histoy diseases : "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                        
                      // Initial Value
                      value:dise[0],
                        
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),    
                        
                      // Array list of items
                      items: dise.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String newValue) { 
                        setState(() {
                          dropdownDisse = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                children: [ 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" Histoy Drugs : "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                        
                      // Initial Value
                      value: druggy[0],
                        
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),    
                        
                      // Array list of items
                      items: druggy.map((String ite) {
                        return DropdownMenuItem(
                          value: ite,
                          child: Text(ite),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String newValue) { 
                        setState(() {
                          dropdownDruggy = newValue;
                        });
                      },
                    ),
                  ),
                ],
            ),
             ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //         children: [
                  
        // //           Row(
        // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // //             children: [
        // // //               Expanded(
        // // //                 flex: 2,
        // // //                 child: Padding(
        // // //                   padding: const EdgeInsets.all(8.0),
        // // //                   child:DropdownButton(
        // // //   items: data.map((item) {
        // // //     return new DropdownMenuItem(
        // // //       child: new Text(item),
        // // //       value:item,
        // // //     );
        // // //   }).toList(),
        // // //   onChanged: (newVal) {
        // // //     setState(() {
        // // //       _mySelection = newVal;
        // // //     });
        // // //   },
        // // //   value: _mySelection,
        // // // ),
  
        // // //                 ),
        // // //               ),
        // //               // Expanded(
        // //               //   flex: 2,
        // //               //   child: Padding(
        // //               //     padding: const EdgeInsets.all(8.0),
        // //               //     child: InkWell(
        // //               //       child: Container(
        // //               //         height: MediaQuery.of(context).size.height / 13,
        // //               //         child: Icon(
        // //               //           Icons.local_pharmacy,
        // //               //           color: Colors.white,
        // //               //         ),
        // //               //         decoration: BoxDecoration(
        // //               //           color: mainColor,
        // //               //           borderRadius: BorderRadius.only(
        // //               //             topRight: Radius.circular(30.0),
        // //               //             bottomLeft: Radius.circular(30.0),
        // //               //           ),
        // //               //         ),
        // //               //       ),
        // //               //       onTap: () {
        // //               //         print("drugs");
        // //               //         _displayDrug(context);
        // //               //       },
        // //               //     ),
        // //               //   ),
        // //               // ),
        // //             ],
        // //           ),
        //         ],
        //       ),
        //     ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                color: mainColor,
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddVisit(
                          //  allStates:jsonResponse["data"]["provider"]["state"],
                          ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          child: Icon(
            Icons.attach_file,
            color: Colors.white,
          ),
          onPressed: () async {
            getPdfAndUpload();
          }),
    );
  }
}

// _displayDisease(BuildContext context) async {
//   //i am trying when user add a disea
//   return showDialog(
//       context: context,
//       builder: (context) {
//         var counter1 = 1;
//         return AlertDialog(
//           title: Text(
//             'History of diseases',
//             style: TextStyle(color: mainColor),
//           ),
          
//           content: Container(
//             decoration: BoxDecoration(border: Border.all()),
//             child: ListView.builder(
//                 itemCount: counter1,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       MyForm(),
// // Form(
// //   key: _formKey,
// //   child: Padding(
// //     padding: const EdgeInsets.all(16.0),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [ 
// //           // name textfield
// //           Padding(
// //             padding: const EdgeInsets.only(right: 32.0),
// //             child: TextFormField( 
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter your name'
// //               ),
// //               validator: (v){
// //                 if(v.trim().isEmpty){
// //                   return 'Please enter something';
// //                 }
// //                 return null;
// //               },
// //             ),
// //           ),
// //           SizedBox(height: 20,),
// //           Text('Add Friends', style: TextStyle(
// //             fontWeight: FontWeight.w700, fontSize: 16),),
// //          // ..._getFriends(),
// //           SizedBox(height: 40,),
// //           FlatButton(
// //             onPressed: (){
// //               if(_formKey.currentState.validate()){
// //                 _formKey.currentState.save();
// //               }
// //           },
// //           child: Text('Submit'),
// //           color: Colors.green,
// //         ),
// //       ],
// //     ),
// //   ),
// // // ),
// // //                       TextField(
// // //                         maxLines: 1,
// // //                         controller: diseaseController[index],
// // //                         decoration: InputDecoration(
// // //                           hintText: "optional note to patient",
// // //                           border: InputBorder.none,
// // //                         ),
// // //                       ),
// //                       // Container(
// //                       //     child: IconButton(
// //                       //   icon: Icon(Icons.add),
// //                       //   onPressed: () {},
// //                       // )),
// // )
//                     ],

//                   );
//                 }),
//           ),
//           actions: <Widget>[
//             new FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(child: new Text('Cancel')),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(child: new Text('Confirm ')),
//                     ),
//                   ],
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       });
// }

// _displayDrug(BuildContext context) async {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'History of drugs',
//             style: TextStyle(color: mainColor),
//           ),
//           content: Container(
//             decoration: BoxDecoration(border: Border.all()),
//             child: TextField(
//               maxLines: 1,
//               controller: historyDrugsController,
//               decoration: InputDecoration(
//                 hintText: "optional note to patient",
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           actions: <Widget>[
//             new FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     InkWell(child: new Text('Cancel')),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     InkWell(child: new Text('ok ')),
//                   ],
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       });
// }
