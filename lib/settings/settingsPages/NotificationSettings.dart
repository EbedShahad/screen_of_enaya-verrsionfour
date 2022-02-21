import 'package:flutter/material.dart';

class NotificationsSettings extends StatefulWidget {
  @override
  _NotificationsSettingsState createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  dynamic newvalue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications Settings"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Recive Notifications via sms"),
              Spacer(),
              Switch(
                onChanged: null,
                value: true,
                activeTrackColor: Colors.teal,

                /* /*value: isDisabled,
                            onChanged: (check) {
                              setState(() {
                                isDisabled = check;
                              });*/
                            }*/
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 34.0,
                  ),
                  Container(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      ),
                      value: 2,
                      items: [
                        DropdownMenuItem(
                          child: Text("+249"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("+61"), value: 3),
                        DropdownMenuItem(child: Text("+234"), value: 5),
                        DropdownMenuItem(child: Text("+234"), value: 6),
                        DropdownMenuItem(child: Text("+234"), value: 7),
                      ],
                      onChanged: (value) {
                        setState(() {
                          newvalue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mobile number"),
                  Container(
                    width: 200.0,
                    child: TextField(
                      cursorColor: Colors.teal,
                      // cursorHeight: 2.0,
                      //  obscureText: true,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        // labelText: "Shahad",
                        hintText: '98434234562',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
