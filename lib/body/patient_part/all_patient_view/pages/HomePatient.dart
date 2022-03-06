import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/body/patient_part/add_new_patient/main_add_patient.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/models/newsInfo.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/services/api_manager.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/patientProfile.dart';

class HomePatient extends StatefulWidget {
  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  Future<AllPatientData> _patientModel;
  @override
  void initState() {
    
    _patientModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All patient'),
        backgroundColor: mainColor,
      ),
      drawer: Drawer(),
      body: Container(
        child: FutureBuilder<AllPatientData>(
          future: _patientModel,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString());
            if (snapshot.hasData) {
              var dataLenght = snapshot.data.data;
              print("has data");
              
             // Text("kvffff");
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount:dataLenght.length,
                  // dataLenght.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color:Colors.teal,
                      // Theme.of(context).primaryColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    // int reverse= dataLenght.length;
                    var patientName = snapshot.data.data[index].name;
                   
                    print(patientName);
                      //  reverse =reverse-1;
                      if (snapshot.data.data[index].patient==null || snapshot.data.data[index].patient.fileNumber==null ){
                        return Container();

              }
                  else {
                     var patientFile =
                        snapshot.data.data[index].patient.fileNumber;
                     return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap:(){ Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PatientProfile(fileNum:patientFile,
                      )));},
                        child: ListTile(
                                      leading: CircleAvatar(
                                        //    radius: 10,
                                        backgroundColor: Colors.teal,
                                        child: Image(
                        image: AssetImage("images/patients/patient.png"),
                                        ),
                                      ),
                                      title: Text(patientName),
                                      subtitle: Text(patientFile),
                                      trailing: CircleAvatar(
                                        backgroundColor: Colors.teal,
                                        // backgroundImage: AssetImage(
                                        //     "images/patients/steth_icon.png"), //NetworkImage
                                        //radius: 100,
                                        child: Image(
                        image: AssetImage("images/patients/steth_icon.png"),
                                        ),
                                      ),
                                    ),
                      ),
                    );}
                
                 
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainaddPatient()));
          setState(() {
            // i++;
          });
        },
      ),
    );
  }
}
