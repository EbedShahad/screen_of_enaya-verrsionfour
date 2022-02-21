import 'package:flutter/material.dart';
import 'package:screen_of_enaya/styleApp.dart';

class HealthJournalSettings extends StatefulWidget {
  @override
  _HealthJournalSettingsState createState() => _HealthJournalSettingsState();
}

class _HealthJournalSettingsState extends State<HealthJournalSettings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Journal Settings "),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  "Allow patients to share health journal updatE",
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    //fontSize: 20,
                  ),
                ),
                Spacer(),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: tealColor,
                  activeColor: tealColor,
                ),
                //Switch(value: value, onChanged: onChanged),
              ],
            ),
            Text(
              "knjfksk jskdfsdk jnjkdfjkdsfsjkd kjfdjkdshfjkI do belive in , they jknjfksk jskdfsdk jnjkdfjkdsfsjkd kjfdjkdshfjk jknsjkfhsjkfds nfdjnsjknd jndjfndskk kjdfjdskf kjndfsfdks lkjdfsjfsl lkjdfldsn kjdfldskjdsl",
              maxLines: 10,
              softWrap: true,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
