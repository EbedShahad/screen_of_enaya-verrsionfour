import 'package:flutter/material.dart';
import 'package:screen_of_enaya/styleApp.dart';

class JournalUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genral Usage"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                child: Image(image: AssetImage("images/settings.png")),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Genral Usage",
                  style: TextStyle(color: tealColor, fontSize: 30)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: RichText(
                    maxLines: 4,
                    softWrap: true,
                    text: TextSpan(
                        text: 'set up your virtual practise to update ',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' frequntly predescribed Meditations ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: '& ',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          TextSpan(
                            text: 'in clinic billable services ',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                  child: Text(
                      "Log in to your web virtual practise to do this at all")),
              Text("https://www.clinicals123.io"),
              /*  Text(
                "set up your virtual practise",
                maxLines: 10,
                softWrap: true,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 20,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
