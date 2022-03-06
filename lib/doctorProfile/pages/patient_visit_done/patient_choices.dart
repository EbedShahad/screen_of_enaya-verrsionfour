import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';

class PatientChoices extends StatelessWidget {
  const PatientChoices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Visit"),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
              //            Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) => AllVisits(
              //             //  allStates:jsonResponse["data"]["provider"]["state"],
              //             ),
              //       ),
              //     );
              //   },
              // ),
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SpecCard("Visits"),
                      ),
                    ),
                    Container(
                      child: SpecCard("lab"),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SpecCard("digansis"),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                        Container(
                      child: SpecCard("preScriptions"),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }

  Widget SpecCard(String title) {
    return CircleAvatar(
      backgroundColor: Colors.teal,
      child: Text(title,style: TextStyle(color: Colors.white),),
    );
  }
}
