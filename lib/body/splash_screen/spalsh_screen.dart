//done
//page no 1
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screen_of_enaya/app/genral/stringss.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // splash screen to show once
  //Shahad you must edit it
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: Pages.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Column(children: [
                          Pages[index],
                        ]),
                      );
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
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: mainColor)),
                        child: Text(
                          s0button,
                          style: TextStyle(color: textColor, fontSize: 14.sp),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainLogin()));
                        },
                      ),
                    ),
                    height: 50.h,
                    width: 300.w,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
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
          color: mainColor,
          /* boxShadow: [
            BoxShadow(
              color: Colors.purple.shade50,
            ),
          ],*/
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
    return Center(
      child: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height / 2.15
                  : MediaQuery.of(context).size.height / 2.88,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.image),
              ),
            ),
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
              color: textColor,
            ),
          ),
          /*   SizedBox(
            height: 10.h,
          ),*/
          Text(welcometext2,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: textColor)),
        ],
      )),
    );
  }
}
