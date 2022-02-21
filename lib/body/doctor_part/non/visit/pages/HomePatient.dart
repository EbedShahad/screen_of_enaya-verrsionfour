// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:screen_of_enaya/app/genral/style_color.dart';
// import 'package:screen_of_enaya/body/doctor_part/patient/visit/models/all_patients_view.dart';
// import 'package:screen_of_enaya/body/doctor_part/patient/visit/services/api_manager.dart';
// import 'package:screen_of_enaya/doctorProfile/pages/new_p/one_patient_det.dart';
// // to show all patients to the docotr
// class HomePatient extends StatefulWidget {
//   @override
//   _HomePatientState createState() => _HomePatientState();
// }

// class _HomePatientState extends State<HomePatient> {
//   Future<AllPatientData> _patientModel;

//   @override
//   void initState() {
//     _patientModel = API_Manager().getNews() as Future<AllPatientData>;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All patient'),
//         backgroundColor: mainColor,
//       ),
//       drawer: Drawer(),
//       body: Container(
//         child: FutureBuilder<AllPatientData>(
//           future: _patientModel,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var dataLenght = snapshot.data.data;
//               return ListView.builder(
//                   itemCount: dataLenght.length,
//                   itemBuilder: (context, index) {
//                     var p_name = snapshot.data.data[index].name;
//                     var p_fileNum =
//                         snapshot.data.data[index].patient.fileNumber;
//                     print(p_name);

//                     return Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white12,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.grey)),
//                       height: 100,
//                       margin: const EdgeInsets.all(8),
//                       child: Row(
//                         children: <Widget>[
//                           SizedBox(width: 16),
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   p_fileNum,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.people,
//                                       color: mainColor,
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       p_name,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                                /* Text(
//                                   gender,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),*/
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   });
//             } else
//               return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: FloatingActionButton(
//         // isExtended: true,
//         child: Icon(Icons.add),
//         backgroundColor:mainColor,
//         onPressed: () {
//             Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) =>IndvidualPatients()));
//           setState(() {
//             // i++;
//           });
//         },
//       ),
//     );
//   }
// }
