import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:screen_of_enaya/body/genral/app_local_storage/token.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/headerLogo.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/main_profile_patient.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/myheader.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/models/prescriptionInfo.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/pages/all_drugs.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/services/pre_manger.dart';

class HomePrescription extends StatefulWidget {
  @override
  _HomePrescriptionState createState() => _HomePrescriptionState();
}

class _HomePrescriptionState extends State<HomePrescription> {
  Future<AllPrescription> _patientModel;
  List<AllDrugs> drugList;
  String token;

  @override
  void initState() {
    final box = GetStorage();
    createPasswordToken();
    token = box.read('token2');
    poviderid = box.read('providerid');
    print("providerid");
    // fetchPost();
   // getSWData();
  //  print(dataa);
    _patientModel = Presc_Manger().getNews();
    super.initState();
  }

  String _mySelection;
  var data ;
    Future<List<AllDrugs> > fetchPost() async {
    // final response =
    // await http.get('http://alkadhum-col.edu.iq/wp-json/wp/v2/posts/');
        var uri =
    Uri.https('www.waaasil.com','/care/api/all-drugs');
  
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var values;
      values = json.decode(response.body);
      if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            drugList .add(AllDrugs.fromJson(map));
            debugPrint('Id-------${map['data']}');
          }
        }
      }
      return drugList;

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  getSWData() async {
    print("inside drusssss");
    // var res = await http.get(
    //     Uri(path: "https://waaasil.com/care/api/all-drugs"),
    //     headers: {
    //       "Accept": "application/json",
    //       'Authorization': 'Bearer $token',
    //     });
        var uri =
    Uri.https('www.waaasil.com','/care/api/all-prescriptions');
  
var res = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });
print(res.statusCode);
        print(res.body.toString());
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });
    print("resBody**************");
    print(resBody);

    return "Sucess";
  }

  var _myActivities;
  String poviderid;
  // String _mySelection;
 // final String url = "https://waaasil.com/care/api/prescription-status/";
  // var response = await http.get(uri, headers: {
  //         'Accept':'application/json',
  //         'Authorization':'Bearer $token',
  //       });

  Color bColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Row(
            children: [
              Text("Pharmacy"),
            ],
          )),
      drawer: Drawer(),
      body: Container(
        child: FutureBuilder<AllPrescription>(
          future: _patientModel,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString());
            print(snapshot.data.toString());
            if (snapshot.hasData) {
              var dataLenght = snapshot.data.data;
              print("has data");
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: dataLenght.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.teal,
                      // Theme.of(context).primaryColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    var drugid = snapshot.data.data[index].drugId;
                    var drugs = [
                      {
                        "id": 1,
                        "name": "Pandol",
                        "created_at": null,
                        "updated_at": null
                      },
                      {
                        "id": 2,
                        "name": "Antibiotic",
                        "created_at": null,
                        "updated_at": null
                      },
                      {
                        "id": 3,
                        "name": "penicillin Injection",
                        "created_at": null,
                        "updated_at": null
                      },
                      {
                        "id": 4,
                        "name": "Cardioflux",
                        "created_at": null,
                        "updated_at": null
                      },
                      {
                        "id": 5,
                        "name": "Panadole Extra",
                        "created_at": "2022-02-08T19:45:57.000000Z",
                        "updated_at": "2022-02-08T19:45:57.000000Z"
                      },
                      {
                        "id": 6,
                        "name": "Panadole Extra",
                        "created_at": "2022-02-08T19:46:20.000000Z",
                        "updated_at": "2022-02-08T19:46:20.000000Z"
                      }
                    ];
                    String druggy = drugs[drugid]["name"];
                    var patientName =
                        snapshot.data.data[index].patient.user.name;
                    var patientFile =
                        snapshot.data.data[index].patient.fileNumber;
                    var presStatus = snapshot.data.data[index].status;
                    var desc = snapshot.data.data[index].discription.toString();

                    var status = snapshot.data.data[index].status.toString();
                    var date = snapshot.data.data[index].date;
                    var quan = snapshot.data.data[index].quantity.toString();
                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    final String formatted = formatter.format(date);
                    String prescripId = snapshot.data.data[index].id.toString();
                    print(status + " kkkkkk");
                    // if (status == "1")

                    //     bColor = Colors.green;
                    if (status == "0") {
                      print(patientName);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        formatted,
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(
                                          image: AssetImage("images/pharm.png"),
                                          width: 35,
                                          height: 35,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.medical_services_outlined,
                                      //   color: mYellowColor,
                                      // ),

                                      Text(
                                        patientName,
                                        style: TextStyle(color: textColor),
                                      ),
                                      Spacer(),
                                      Text(
                                        patientFile,
                                        style: TextStyle(color: textColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Patinet Name : ",
                                        style: TextStyle(color: textColor),
                                      ),
                                      Text(
                                        patientName,
                                        style: TextStyle(color: textColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Decription : ",
                                          style: TextStyle(color: textColor)),
                                      Text(
                                        desc,
                                        style: TextStyle(color: textColor),
                                        maxLines: 3,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Drugs  : ",
                                          style: TextStyle(color: textColor)),
                                      Text(
                                        druggy,
                                        maxLines: 3,
                                        softWrap: true,
                                        style: TextStyle(color: textColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Quanity  : ",
                                        style: TextStyle(color: textColor),
                                      ),
                                      Text(
                                        quan,
                                        maxLines: 3,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                  //  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showAlertDialog(context, prescripId,status);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(),
                                        Text(
                                          "Done",
                                          style: TextStyle(color: bColor),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: bColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else
                      return Container(
                        child: Text(" No prescriptions to show now "),
                      );
                    //  Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.white12,
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: Colors.grey)),
                    //   height: 100,
                    //   //  height: MediaQuery.of(context).size.height / 3.0,
                    //   margin: const EdgeInsets.all(8),
                    //   child: Row(
                    //     children: <Widget>[
                    //       SizedBox(width: 16),
                    //       Flexible(
                    //         child: Column(
                    //           crossAxisAlignment:
                    //               CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               patientFile,
                    //               style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Icon(
                    //                   Icons.people,
                    //                   color: mainColor,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 10,
                    //                 ),
                    //                 Text(
                    //                   patientName,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   style: TextStyle(
                    //                       fontSize: 20,
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //               ],
                    //             ),
                    //             /* Text(
                    //                 gender,
                    //                 maxLines: 2,
                    //                 overflow: TextOverflow.ellipsis,
                    //               ),*/
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  });
            } else {
              print("Return value");
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.teal,
              ));
            }
          },
        ),
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: mainColor,
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => MainaddPatient()));
          setState(() {
            // i++;
          });
        },
      ),*/
    );
  }
}

// ignore: non_constant_identifier_names
 ChangePrescripStatus(String prescId,String status) async {
   final box =GetStorage();
   String token;
    token = box.read('token2');
//    var headers = {
//   'Authorization': 'Bearer $token',
//   'Accept': 'application/json'
// }; 
final queryParameters = {
  'prescrip_id':prescId,
  'status':status,
};
var uri =
    Uri.https('www.waaasil.com','/care/api/prescription-status', queryParameters);
  
var response = await http.get(uri, headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token',
        });
if (response.statusCode==200){
  print(response.body);
  print("updated ");
}
else {
print("notfound");
}
//var request = http.Request('GET', Uri.parse('https://waaasil.com/care/api/prescription-status?prescrip_id=6&status=1'));

//request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

 }
showAlertDialog(BuildContext context, String pres ,String status) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.teal),
    ),
    onPressed: () {
      ChangePrescripStatus(pres,"1");
    },
  );
  Widget noButton = TextButton(
    child: Text(
      "No",
      style: TextStyle(color: Colors.teal),
    ),
    onPressed: () {
       ChangePrescripStatus(pres,"0");
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Dear Pharmicist"),
    content: Text("All this drugs found ?"),
    actions: [
      okButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
