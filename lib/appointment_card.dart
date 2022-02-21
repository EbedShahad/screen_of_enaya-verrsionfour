import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // toolbarHeight: 30.0,
          backgroundColor: Color(0xFF40495E),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.refresh, size: 15.0),
                tooltip: 'Refresh',
                onPressed: () {
                  // _refreshIndicatorKey.currentState.show();
                }),
          ],
          title: //Center(
              //child:
              Text("March 2021"),
        ),
        //appbar for refresh button and showing the date
        // ),
      ),
      /*RefreshIndicator(
    key: _refreshIndicatorKey,
    onRefresh: _refresh,
    child: ListView(children: [
      // body of above
    ])),*/
      body: Column(
        children: <Widget>[
          Row(
            //mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(),
              Text("new"),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                // child: Text(" "),
              ),
              //Text("1"),

              Text("Confirmed"),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                //child: Text("1"),
              ),
            ],
          ),
          /* Padding(
            padding: EdgeInsets.all(16.0),
            child: 
            */

          Row(
            children: [
              Text("28."),
              Text("March"),
              Text(", Sunday"),
            ],
          ),
          SizedBox(
            height: 10.0,
            // width: 10.0,
          ),
          /* ListTile(
            isThreeLine: false,
            leading: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/female.png"),
                ),
                Text("10:45"),
                //
                Text("EAT"),
              ],
            ),
            title: Text('Horse'),
          ),
         */ //),
          /*   Padding(
            padding: EdgeInsets.all(16.0),
            child: 
            */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      border: Border(
                        left: BorderSide(width: 5.0, color: Colors.orange),
                        //bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(),

                        //sechuled time
                        Text("10:45"),
                        //
                        Text("EAT"),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.0,
                    height: 10.0,
                  ),
                  Text("Mohammed Saeed "),
                  Text("Video Consultaion (15 minutes )"),
                  Text("with Ms.Hiba Adil "),
                  Text("Hiba Adil "),
                  Row(
                    children: [
                      Text("free"),
                      //Icon(IconData(Icon.home)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Cancel"),
                      Text("Resechudle"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          //  ),
        ],
      ),
    );

    /*Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Row(children: <Widget>[
            Spacer(),
            Container(
              width: 10.0,
              height: 10.0,
              decoration: new BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Text("New"),
            Container(
              width: 10.0,
              height: 10.0,
              decoration: new BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            Text("Confirmed"),
          ]),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          height: 300.0,
          width: 400.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/appointments.png'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        Text("No Appointments To show "),
      ],
    );*/
  }
}
