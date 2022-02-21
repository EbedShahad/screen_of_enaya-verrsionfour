import 'package:flutter/material.dart';

class TestShaed extends StatelessWidget {
  const TestShaed({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child:Column(
        children: [
          MaterialButton(onPressed:(){}, child: Text("Make ref token"),),
          MaterialButton(onPressed: (){},child:Text("show  ref token ")),        ],
      )),
      
    );
  }
}