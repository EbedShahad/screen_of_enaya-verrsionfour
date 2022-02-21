import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
 String name = "createPasswordToken()";
  final shared = sharingData();
 @override
void initState() { 
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  name ="Ali ahmef ";
                  shared.initToken(name);
                });
              },
              child: Text("create token"),
              color: Colors.green,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  name = "Shahad";
                   shared.initToken(name);
                });
              },
              child: Text("Get"),
            ),    
            MaterialButton(
              onPressed: (){
                setState(() {
                 
                });
              }
              ,child: Text(name),
              color: Colors.blue,),
              Text(name),
          ],
        ),
      ),
    );
  }
}
