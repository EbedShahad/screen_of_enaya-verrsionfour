import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Screen2'),
        ),
        body: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Row(
                children: [
                  SizedBox(
                    child: ColorizeAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "C",
                      ],
                      textStyle: TextStyle(
                          fontSize: 80.0,
                          fontFamily: "DancingScript.ttf",
                          fontWeight: FontWeight.w900),
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue,
                        Colors.purpleAccent,
                        Colors.purple,
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    child: ColorizeAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "are",
                      ],
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "Pacifico.ttf",
                          fontWeight: FontWeight.w800),
                      colors: [
                        Colors.blue,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
