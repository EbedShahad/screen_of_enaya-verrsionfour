import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/headerLogo.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/main_profile_patient.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/myheader.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/models/prescriptionInfo.dart';
import 'package:screen_of_enaya/body/pharmicy_part/showAllPres/services/pre_manger.dart';

class HomePrescription extends StatefulWidget {
  @override
  _HomePrescriptionState createState() => _HomePrescriptionState();
}

class _HomePrescriptionState extends State<HomePrescription> {
  Future<AllPrescription> _patientModel;

  var _myActivities;
  @override
  void initState() {
    _patientModel = Presc_Manger().getNews();
    super.initState();
  }

  Color bColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Pharmacy"),
      ),
      drawer: Drawer(),
      body: Container(
        child: FutureBuilder<AllPrescription>(
          future: _patientModel,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString());
            if (snapshot.hasData) {
              var dataLenght = snapshot.data.data;

              print("has data");
              // Text("kvffff");

              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: dataLenght.length,
                  separatorBuilder: (context, index) {
                    List _myActivities;
                    String _myActivitiesResult;
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
                                        child: Icon(
                                          Icons.medical_services_outlined,
                                          color: mYellowColor,
                                        ),
                                      ),
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
                                      Text("Decription : ", style: TextStyle(color: textColor)),
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
                                      Text("Drugs  : ", style: TextStyle(color: textColor)),
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
                                      Text("Quanity  : ", style: TextStyle(color: textColor),),
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
                                      showAlertDialog(context, prescripId);
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

void ChangePrescripStatus(String prescId) {}
showAlertDialog(BuildContext context, String pres) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.teal),
    ),
    onPressed: () {
      ChangePrescripStatus(pres);
    },
  );
  Widget noButton = TextButton(
    child: Text(
      "No",
      style: TextStyle(color: Colors.teal),
    ),
    onPressed: () {},
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
