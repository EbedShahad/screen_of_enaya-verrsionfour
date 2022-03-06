import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';

class InActive extends StatefulWidget {
  // const InActive({Key key}) : super(key: key);
  @override
  State<InActive> createState() => _InActiveState();
}

class _InActiveState extends State<InActive> {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  //   Future onSelectNotification(String payload) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return new AlertDialog(
  //         title: Text("PayLoad"),
  //         content: Text("Payload : $payload"),
  //       );
  //     },
  //   );
  // }

  //  void initState() {

  //   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project   
  //    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
  //   var initializationSettingsAndroid =
  //       new AndroidInitializationSettings('app_icon'); 
  //   // var initializationSettingsIOS = new IOSInitializationSettings();
  //   var initializationSettings = new InitializationSettings(
  //      android: initializationSettingsAndroid);
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       selectNotification: onSelectNotification);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child:ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // scale: 10.0,
                      fit: BoxFit.contain,
                      image: AssetImage("images/Login_screen/inActive.png"),
                    ),
                  ),
                ),
              ),
              Text(
                "Your acount is not active \n ",
                style: TextStyle(color: Colors.teal, fontSize: 25),
              ),
              Text("please call the mangement ",
                  style: TextStyle(color: Colors.teal, fontSize: 25)),
              Spacer(),
               
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  onPressed: () {
                    _callNumber();
                  },
                  color: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  onPressed: () {
                    //  _showNotificationWithSound();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainLogin()));
                  },
                  color: Colors.teal,
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Future _showNotificationWithSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       sound: 'slow_spring_board',
//       importance: Importance.Max,
//       priority: Priority.High);
//   var iOSPlatformChannelSpecifics =
//       new IOSNotificationDetails(sound: "slow_spring_board.aiff");
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'New Post',
//     'How to Show Notification in Flutter',
//     platformChannelSpecifics,
//     payload: 'Custom_Sound',
//   );
// }
  _callNumber() async {
    const number = '0960262441'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
