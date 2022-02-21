import 'package:flutter/material.dart';
import 'package:screen_of_enaya/settings/VirtualPractiseWeb/MainPage.dart';
import 'package:screen_of_enaya/settings/lsetlist.dart';
import 'package:screen_of_enaya/settings/settingsPages/HJS.dart';
import 'package:screen_of_enaya/settings/settingsPages/JounralUsage.dart';
import 'package:screen_of_enaya/settings/settingsPages/NotificationSettings.dart';
import 'package:screen_of_enaya/settings/settingsPages/PatientSettings.dart';
import 'package:screen_of_enaya/settings/settingsPages/PaymentSet.dart';
import 'package:screen_of_enaya/settings/settingsPages/TCS.dart';
import 'package:screen_of_enaya/settings/settingsPages/TextCosultationSettings/mainPage.dart';
import 'package:screen_of_enaya/settings/settingsPages/UnitMe.dart';
import 'package:screen_of_enaya/settings/settingsPages/VPA.dart';
//import 'package:screen_of_enaya/settings/settingsPages/VPW.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3343),
        title: Text("Settings"),
        actions: [],
      ),
      body: Container(
        child: ListView(
          children: [
            // Listset({this.labelTitle, this.icon2, this.ontap2});
            Listset(
              labelTitle: "Virtual Practice Acount",
              icon2: Icons.home,
              ontap2: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VirtualPracticeAcount(),
                  ),
                );
              },
            ),
            Listset(
                labelTitle: "Virtual Practise Web",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VirtualPractiseWeb(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Text Consultaion Settings",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextConsultaionSettings(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Payment Settings",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSettings(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Notifications Settings ",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsSettings(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Patient Settings",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientsSettings(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Unit Measurements",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnitMeasu(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "health Journal Settings",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthJournalSettings(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "Genral Usage",
                icon2: Icons.home,
                ontap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JournalUsage(),
                    ),
                  );
                }),
            Listset(
                labelTitle: "LogOut",
                icon2: Icons.phonelink_lock_outlined,
                ontap2: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Logout"),
                            content: Text("Are you sure you want to logout ?"),
                            actions: [
                              TextButton(onPressed: null, child: Text("Ok")),
                              TextButton(
                                  onPressed: null, child: Text("Cancel")),
                            ],
                          ));
                }),
          ],
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
