import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:screen_of_enaya/drawer/header.dart';

import 'Patient/PatientDeatilsMain.dart';

class Patients extends StatelessWidget {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Patients"),
        backgroundColor: Color(0xFF2C3343),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Showing :",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  Text(
                    "Active Patients",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Image.asset(
                              "images/filtericon.png",
                              fit: BoxFit.fitHeight,
                              height: 25.0,
                              width: 25.0,
                              color: Colors.grey,
                            ),
                            Text("Filter",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Doccard(),
            // Doccard(),
            GestureDetector(
              onTap: () => pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name: "PateintDetils1"),
                screen: PateintDetils1(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
              child: Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height / 1.41
                        : MediaQuery.of(context).size.height / 2.50,
                child: ListView.separated(   
                  itemBuilder: (context, index) => Card(
                    semanticContainer: false,
                    child: Container(
                      color: Colors.white,
                      height: 80,
                      // MediaQuery.of(context).orientation ==
                      //         Orientation.portrait
                      //     ? MediaQuery.of(context).size.height / 0.33
                      //     : MediaQuery.of(context).size.height / 0.33,
                      child: ListTile(
                        enabled: false,
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          // foregroundColor: Colors.white,
                          // radius: 50,
                          child: Image(
                            color: Colors.white,
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                            image: AssetImage('images/profile1.png'),
                          ),
                        ),
                        title: Text(
                          "Pateient name ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Color(0xFFFD6769),
                          child: Image(
                              // fit: BoxFit.cover,
                              color: Colors.white,
                              image: Image.asset(
                                "images/pateientCards/stethoscope.png",
                                fit: BoxFit.cover,
                                width: 20,
                                height: 20,
                              ).image),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
