import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:screen_of_enaya/body/examiner_part/models/examnerInfo.dart';
import 'package:screen_of_enaya/body/examiner_part/pages/Exam.dart';
import 'package:screen_of_enaya/body/examiner_part/services/examner_manger.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/headerLogo.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/main_profile_patient.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/myheader.dart';

class HomeExamner extends StatefulWidget {
  @override
  _HomeExamnerState createState() => _HomeExamnerState();
}

class _HomeExamnerState extends State<HomeExamner> {
  Future<AllExams> _patientModel;

  var _myActivities;
  @override
  void initState() {
    _patientModel = Examener_manger().getNews();
    super.initState();
  }

  Color bColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("laboratory "),
      ),
      drawer: Drawer(),
      body: Container(
        child: FutureBuilder<AllExams>(
          future: _patientModel,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString());
            if (snapshot.hasData) {
              var dataLenght = snapshot.data.data.length;
              // print(dataLenght.length);

              print("has data");
           

              return ListView.separated(
                  shrinkWrap: true,
                  itemCount:dataLenght,
                  //dataLenght.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.teal,
                      // Theme.of(context).primaryColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    var drugid = snapshot.data.data[index].tests[index].name;

                    //     String druggy = drugs[drugid]["name"];
                    //     var patientName =
                    //         snapshot.data.data[index].patient.user.name;
                    //     var patientFile =
                    //         snapshot.data.data[index].patient.fileNumber;
                    //     var presStatus = snapshot.data.data[index].status;
                    //     var desc = snapshot.data.data[index].discription.toString();

                    var status = snapshot.data.data[index].status.toString();
                    var date = snapshot.data.data[index].date;
                    // //    var quan = snapshot.data.data[index].quantity.toString();
                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    final String formatted = formatter.format(date);
                    //     String prescripId = snapshot.data.data[index].id.toString();
                    //     print(status + " kkkkkk");
                    //     // if (status == "1")

                    //     bColor = Colors.green;
                    if (status == "0") {
                      print("patientName");
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
                                          Icons.bloodtype,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Text(
                                        "Lab Test",
                                        style: TextStyle(color: textColor),
                                      ),
                                      // Spacer(),
                                      // Text(
                                      //  " patientFile",
                                      //   style: TextStyle(color: textColor),
                                      // ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Notes : ",
                                        style: TextStyle(color: textColor),
                                      ),
                                      Text(
                                        snapshot.data.data[index].notes,
                                        style: TextStyle(color: textColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(" Tests : ",
                                          style: TextStyle(color: textColor)),
                                      Text(
                                        snapshot
                                            .data.data[index].tests[index].name
                                            .toString(),
                                        style: TextStyle(color: textColor),
                                        maxLines: 3,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                 
                                  //  Spacer(),
                                  InkWell(
                                    onTap: () {
                                       Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Exam()));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(),
                        
                                       
                                        CircleAvatar(
                                          backgroundColor: Colors.white10,
                                          child:
                                        Icon(
                                          Icons.add,
                                          color: Colors.pink,
                                        ), ),
                                       
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
