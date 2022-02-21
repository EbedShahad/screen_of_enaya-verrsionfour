import 'package:flutter/material.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/menu_car.dart';
import 'package:screen_of_enaya/body/patient_part/patient_profile/pages/myheader.dart';
const mPrimaryTextColor = Color(0xFF25257E);
const mTitleTextColor = Color(0xFF25257E);
const mBackgroundColor = Color(0xFFFDFCFF);
const mSecondBackgroundColor = Color(0xFFBCCBF3);
const mButtonColor = Color(0xFF5063FF);
const mYellowColor = Color(0xFFFB7B11);
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          MyHeader(
            height: //333,
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height / 2.44
                    : MediaQuery.of(context).size.height / 1,
            imageUrl: 'assets/images/welcome.png',
            child: Column(
              children: <Widget>[
              //  HeaderLogo(), 
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 28,
                    color: mTitleTextColor,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'for each patient ,\n we have diffrent acount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 36,
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mBackgroundColor, mSecondBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Our Health\nServices',
                          style: TextStyle(
                            color: mTitleTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.menu,
                          color: mSecondBackgroundColor,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MenuCard(
                        imageUrl:'assets/images/general_practice.png',
                        title: 'General Information',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ReserveScreen();
                          //     },
                          //   ),
                          // );
                        },
                      ),
                      MenuCard(
                        imageUrl: 'assets/images/specialist.png',
                        title: 'CMS',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MenuCard(
                        imageUrl: 'assets/images/sexual_health.png',
                        title: 'Social Information',
                      ),
                      MenuCard(
                        imageUrl: 'assets/images/immunisation.png',
                        title: 'Lab',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
