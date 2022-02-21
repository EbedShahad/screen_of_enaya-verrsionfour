import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final feildKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Text Page')),
      body: Form(
        key: feildKey,
        child: Column(
          children: [
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
                validator: (value) =>
                    value.isEmpty || value == null ? 'enter email ' : null
                //print(error_message);
                ),
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
                validator: (value) =>
                    value.isEmpty || value == null ? 'enter pass ' : null
                //print(error_message);
                ),
            RaisedButton(onPressed: () {
              if (feildKey.currentState.validate()) print('OK');
            })
          ],
        ),
      ),
    );
  }
}
