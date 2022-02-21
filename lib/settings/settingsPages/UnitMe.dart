import 'package:flutter/material.dart';
import 'package:screen_of_enaya/styleApp.dart';

class UnitMeasu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Unit measurements "),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                child: Text(
                  'Set Default Tracker Units that you will be using',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            UnitCont(
              title: 'Height',
              imagee: 'images/US/height.png',
            ),
            UnitCont(
              title: 'Weight',
              imagee: 'images/US/scale.png',
            ),
            UnitCont(
              title: 'Waist',
              imagee: 'images/US/body.png',
            ),
            UnitCont(
              title: 'Temperature',
              imagee: 'images/US/thermometer.png',
            ),
            UnitCont(
              title: 'Blood Suger',
              imagee: 'images/US/blood-test.png',
            ),
            UnitCont(
              title: 'Blood Ketone',
              imagee: 'images/US/blood-test.png',
            ),
            UnitCont(
              title: 'Urine Glucose',
              imagee: 'images/US/blood-test.png',
            ),
            UnitCont(
              title: 'Cholesterol',
              imagee: 'images/US/cholesterol.png',
            ),
            SizedBox(height: 10),
            /* RaisedButton(
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              disabledColor: Colors.blue,
            ),*/
          ],
        ),
      ),
    );
  }
}

class UnitCont extends StatefulWidget {
  UnitCont({this.imagee, this.title});
  String imagee;
  String title;
  @override
  _UnitContState createState() => _UnitContState();
}

class _UnitContState extends State<UnitCont> {
  dynamic valueDrop = "a";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(widget.imagee),
                  width: 30,
                  color: tealColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Container(
              width: 180,
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade600, width: 0.5))),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: valueDrop,
                    items: [
                      DropdownMenuItem(
                        child: Text('a'),
                        value: 'a',
                      ),
                      DropdownMenuItem(
                        child: Text('b'),
                        value: 'b',
                      ),
                      DropdownMenuItem(
                        child: Text('c'),
                        value: 'c',
                      ),
                      DropdownMenuItem(
                        child: Text('d'),
                        value: 'd',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueDrop = value;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*class UnitMeasu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text("set default tracker units that you will be using "),
            UnitMeas(
              title: "Height",
              icon1: Icons.height,
              data1: "CM",
              data2: "Inch",
              data3: "Foott",
            ),
            UnitMeas(
              title: "Weight",
              icon1: Icons.home,
              data1: "CM",
              data2: "Inch",
              data3: "Foott",
            ),
            UnitMeas(
              title: "Waist",
              icon1: Icons.height,
              data1: "CM",
              data2: "Inch",
              data3: "Foott",
            ),
            UnitMeas(
              title: "temeprure",
              icon1: Icons.height,
              data1: "Calculis",
              data2: "Fehranhiate",
              data3: "Foott",
            ),
            UnitMeas(
              title: "blood sugar",
              icon1: Icons.height,
              data1: "mg/dl",
              data2: "mmol",
              data3: "Foott",
            ),
            UnitMeas(
              title: "Blood Ketone",
              icon1: Icons.height,
              data1: "mg/dl",
              data2: "mmol",
              data3: "Foott",
            ),
            UnitMeas(
              title: "Urine GLucose",
              icon1: Icons.height,
              data1: "mg/dl",
              data2: "mmol",
              data3: "Foott",
            ),
            UnitMeas(
              title: "Closterol",
              icon1: Icons.height,
              data1: "mg/dl",
              data2: "mmol",
              data3: "Foott",
            ),
          ],
        ),
      ),
    );
  }
}

class UnitMeas extends StatefulWidget {
  String data1, data2, data3;
  String title;
  IconData icon1;
  int newvalue = 1;
  UnitMeas({this.title, this.icon1, this.data1, this.data2, this.data3});
  //List <String>listItem = [Widget.data1, data2, data3];

  @override
  _UnitMeasState createState() => _UnitMeasState();
}

class _UnitMeasState extends State<UnitMeas> {
  int newvalue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            widget.icon1,
            color: Colors.teal,
            size: 40,
          ),
          Text(widget.title),
          Spacer(),
          Container(
            width: 100,
            child: DropdownButton(
              hint: DropdownMenuItem(
                child: Text(widget.data1),
                value: 2,
              ),
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.red,
              ),
              items: [
                DropdownMenuItem(
                  child: Text(widget.data1),
                  value: 2,
                ),
                DropdownMenuItem(child: Text(widget.data2), value: 3),
                DropdownMenuItem(child: Text(widget.data3), value: 4),
              ],
              onChanged: (value) {
                setState(() {
                  newvalue = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
*/
