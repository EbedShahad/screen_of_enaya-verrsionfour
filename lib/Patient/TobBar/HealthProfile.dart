import 'package:flutter/material.dart';

class HealthProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          listOfProfile("Health Condation", "Not specified"),
          listOfProfile("Meditiation", "Not specified"),
          listOfProfile("", "Not specified"),
          listOfProfile("Allergies", "Not specified"),
          listOfProfile("Social history", "Not specified"),
          listOfProfile("Family Medical History", "Not specified"),
          listOfProfile("Contracdation", "Not specified"),
        ],
      ),
    );
  }

  Widget listOfProfile(String mainTitle, String status) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              mainTitle,
              style: TextStyle(color: Colors.tealAccent),
            ),
            subtitle: Text(status),
          ),
        ),
        // Divider(),
      ],
    );
  }
}
