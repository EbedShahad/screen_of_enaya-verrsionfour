import 'package:flutter/material.dart';

class AddPrescripton extends StatefulWidget {
  AddPrescripton({Key key}) : super(key: key);

  @override
  State<AddPrescripton> createState() => _AddPrescriptonState();
}

class _AddPrescriptonState extends State<AddPrescripton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Column(
        children: [
          Text("aaaa"),
        ],
      ),),
    );
  }
}