import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/DatePicker.dart';
import 'package:screen_of_enaya/data.dart';
import 'package:screen_of_enaya/styleApp.dart';

class Appointments extends StatelessWidget {
  final _textFieldController = TextEditingController();
  _addApointmnetDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Select Appointment Type',
              // style: TextStyle(color: tealColor),
            ),
            content: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.local_hospital_outlined,
                        size: 45.0,
                        color: Colors.orange,
                      ),
                      Text(
                        " Clinic Appointment",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.video_call,
                        size: 45.0,
                        color: Colors.orange,
                      ),
                      Text(
                        "video Appointment",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(border: Border.all()),
            //   child: TextField(
            //     maxLines: 4,
            //     controller: _textFieldController,
            //     decoration: InputDecoration(
            //       hintText: "",
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // actions: <Widget>[
            //   new FlatButton(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         children: [
            //           new Text('Cancel'),
            //           new Text('ok'),
            //         ],
            //       ),
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   )
            // ],
          );
        });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Add Note',
              style: TextStyle(color: tealColor),
            ),
            content: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLines: 4,
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "",
                  border: InputBorder.none,
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      new Text('Cancel'),
                      new Text('ok'),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayResechudle(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Resechudle Apointmnets',
              style: TextStyle(color: tealColor),
            ),
            content: Column(
              children: [
                MyTextFieldDatePicker(
                  labelText: "Date",
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now().add(Duration(days: 1)),
                  onDateChanged: (selectedDate) {
                    // Do something with the selected date
                  },
                  dateFormat: DateFormat(),
                  //key:key,
                  focusNode: FocusNode(), key: Key("date and time"),
                ),
                TextField(),
                Text(
                  'Note',
                  style: TextStyle(color: tealColor),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    maxLines: 4,
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      new Text('Cancel'),
                      new Text('ok'),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayConfirm(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Confirm Appointment',
              style: TextStyle(color: tealColor),
            ),
            content: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLines: 4,
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "optional note to patient",
                  border: InputBorder.none,
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(child: new Text('Cancel')),
                      InkWell(child: new Text('Confirm ')),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // print();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF2C3343),
          title: Text("Appointments"),
          bottom: TabBar(
            tabs: [
              Text(
                "New",
                style: TextStyle(fontSize: 12.0),
              ),
              Text(
                "Recommended",
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          actions: [
            //    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  _addApointmnetDialog(context);
                },
                icon: Icon(Icons.add)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notification_add),
            ),
          ],
        ),
        /* appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            // toolbarHeight: 30.0,
            backgroundColor: Color(0xFF40495E),
            actions: <Widget>[
              new IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(Icons.refresh, size: 15.0),
                  onPressed: () {}),
            ],
            title: Text(
              "March 2021",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              ),
            ),
          ),
        ),*/
        body: TabBarView(
          children: [
            // New
            ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ", Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left:
                                  BorderSide(width: 2.0, color: Colors.orange),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        " awaiting Response",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left:
                                  BorderSide(width: 2.0, color: Colors.orange),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        " awaiting Response",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ", Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left:
                                  BorderSide(width: 2.0, color: Colors.orange),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        " awaiting Response",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            // onfirmed

            ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ", Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left: BorderSide(width: 2.0, color: Colors.green),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        " Confirmed",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ", Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left: BorderSide(width: 2.0, color: Colors.green),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        " Confirmed",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 3.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "28.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "March",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ", Sunday",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.3, color: Colors.grey),
                              left: BorderSide(width: 2.0, color: Colors.green),
                            ),
                            // color: Colors.indigo,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('images/female.png'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("10:45"),
                                      Text("EAT"),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Video Consultaion",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "15 minutes",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "with Dr.Hiba",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Text(
                                          "Hiba Adil",
                                          style: TextStyle(color: Colors.grey),
                                          // maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.check,
                                                size: 15.0,
                                                color: Colors.green),
                                            Text(
                                              "Free",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              // maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 45.0,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        " Confirmed",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () => _displayDialog(context),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => _displayResechudle(context),
                                    child: Text(
                                      "Resechdule",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _displayConfirm(context),
                                    child: Text(
                                      "Cofirm",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
