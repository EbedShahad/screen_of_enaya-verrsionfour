import 'dart:io';

import 'package:flutter/material.dart';
import 'package:screen_of_enaya/genral/sharepref.dart';
import 'package:screen_of_enaya/genral/stringss.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:screen_of_enaya/register_Pages/register_screens/screen1.dart';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  // splash screen to show once
  // Future<bool> _init() async {
  //   bool firstLaunch = await sharingData().setFirstTimeLaunch(firstTime: false);
  // }
  static double shadow1 = 0;
  static double shadow2 = 0;
  static double shadow3 = 0;
  static double size1 = 12;
  static double size2 = 12;
  static double size3 = 12;

  PageController _controller = PageController(
    initialPage: 0,
  );

  List<double> shadows = [
    shadow1,
    shadow2,
    shadow3,
  ];
  List<double> sizes = [
    size1,
    size2,
    size3,
  ];

  List<Widget> Pages = [
    ImageCont(
      image: 'images/welcome_screen/welcome1.png',
    ),
    ImageCont(
      image: 'images/welcome_screen/welcome2.png',
    ),
    ImageCont(
      image: 'images/welcome_screen/welcome3.png',
    ),
  ];

  int currentIndexx;
  Duration duration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    //  width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    return ScreenUtilInit(
      designSize: Size(400, 690),
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                height: 100.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.teal,
                        Colors.teal.shade100,
                      ]),
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(220),
                      bottomRight: Radius.circular(220)),
                ),
                child: Center(
                  child: Text(
                    s0title,
                    // AppLocalizations.of(context).title,
                    style: TextStyle(
                      fontSize: 80.sp,
                      color: Colors.white,
                      fontFamily: "DancingScript.ttf",
                      //  fontWeight: FontWeight.bold
                    ),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: Pages.length,
                //scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  //   _controller.jumpToPage(1);
                  // sleep(duration);

                  return Column(children: [
                    Pages[index],
                  ]);
                },
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    currentIndexx = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 150.w,
                  ),
                  Pointt(
                    size: currentIndexx == 0 ? 30 : 8,
                  ),
                  Pointt(
                    size: currentIndexx == 1 ? 30 : 8,
                  ),
                  Pointt(
                    size: currentIndexx == 2 ? 30 : 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Material(
                  elevation: 0.5,
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                  //Color(0xFF2C3343),
                  //color: Colors.blue.shade800,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.tealAccent.shade700)),
                    child: Text(
                      s0button,

                      // AppLocalizations.of(context).button1,
                      style: TextStyle(
                          color: Colors.tealAccent.shade700, fontSize: 14.sp),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen1()));
                    },
                  ),
                ),
                width: double.infinity.w,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}

/*
the 3 dots at the bottom 

 */
class Pointt extends StatefulWidget {
  Pointt({this.size});

  double size;

  @override
  _PointtState createState() => _PointtState();
}

class _PointtState extends State<Pointt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: widget.size.w,
        height: 8.h,
        decoration: BoxDecoration(
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade50,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

/*
images and texts 
 */
class ImageCont extends StatefulWidget {
  ImageCont({this.image});
  String image;

  @override
  _ImageContState createState() => _ImageContState();
}

class _ImageContState extends State<ImageCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image(
          image: AssetImage(widget.image),
        ),
        /* SizedBox(
          height: 20,
        ),*/
        Text(
          welcomeText1,

          // AppLocalizations.of(context).long,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.tealAccent.shade700,
          ),
        ),
        /*   SizedBox(
          height: 10.h,
        ),*/
        Text(welcometext2,
            // AppLocalizations.of(context).short,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Colors.tealAccent.shade700)),
      ],
    ));
  }
}
