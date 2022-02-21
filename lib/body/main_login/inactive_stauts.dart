import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class InActive extends StatelessWidget {
  const InActive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // scale: 10.0,
                      fit: BoxFit.contain,
                      image: AssetImage("images/Login_screen/inActive.png"),
                    ),
                  ),
                ),
              ),
              Text(
                "Your acount is not active \n ",
                style: TextStyle(color: Colors.teal, fontSize: 25),
              ),
              Text("please call the mangement ",
                  style: TextStyle(color: Colors.teal, fontSize: 25)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  onPressed: () {
                    _callNumber();
                  },
                  color: Colors.teal,
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _callNumber() async {
    const number = '0960262441'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
