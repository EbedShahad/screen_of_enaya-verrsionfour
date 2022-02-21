//to add visit for patient

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddVisit extends StatefulWidget {
  AddVisit({Key key}) : super(key: key);

  @override
  State<AddVisit> createState() => _AddVisitState();
}

class _AddVisitState extends State<AddVisit> {
  DateTime selectedDate = DateTime.now();

  List<Widget> _children = [];

  int _count = 0;

  void _add() {
    _children = List.from(_children)
      ..add(TextFormField(
        decoration: InputDecoration(hintText: "This is TextField ${_count}"),
      ));
    setState(() => ++_count);
  }

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    List<bool> _value = [false];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("patient name and file number "),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                Text(formattedDate),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
ShowComplaints () async {
  var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZGIxZmM2MjA1ZTBiYjg0Yzc2NGJkYWVmODQzODllY2U5NGY3NWQ3NTkxNjE5ZDQyZjhiYzQ1ZGYwMmVjZDk2NzA1YjBmYWYzNDM0YWEzNmYiLCJpYXQiOjE2NDM4NzMyMTYuNjE5MzEyMDQ3OTU4Mzc0MDIzNDM3NSwibmJmIjoxNjQzODczMjE2LjYxOTMxNjEwMTA3NDIxODc1LCJleHAiOjE2NDM4NzY4MTUuNDY0NTAyMDk2MTc2MTQ3NDYwOTM3NSwic3ViIjoiMjIiLCJzY29wZXMiOltdfQ.b1WAnVFjKxVTOjW47gBVu1fb6ZshFSuLEaNWJLoQOvRP3K9Tws5i0I6P_Gx1ZjI0VBReoOcuT0kEpVZqvmbtcFclBdAUX42YR88yG76D8FmLb2cOjRr_VHf9P9bomqj0_9RX4vnZ07pgc5QzSpqHOIB47QidmLBEHtqLGWhetpNv-N_fdY1Um_3PyjWm5EeKSn0tlEP_mjlIbxIzoFJq3AduIF8G2lKPjV58phdmpLmeLKJ07LfrS6fgest2lKQ_GNlpbu6UqCbxC5WTIIBP6oEbZIQFA2DYTrzQby1wqNPQtLNvoSphu42j4fHknDbebQxYR2j17UwClIvcZKzZNBmvQ_totiQ2ols1wNGzFy2ZuIUsQVzuqdW_dmkbduCCy2myF_pIKl-i39PiUNNZbnz9meUUY9dY0OXXOPmG0GPv0ReXM_aTGjlK1hd5BRfWbH4f40Ap1jXeyf_JEevH39ernA5N5Evx46smwe5NUGyYRB3IefAIO8XaPeIl-A2B3huNL4Ne-7oBu-k49c_AjTQNzn5L9epGJXvwqkyRCtaCmZYuOkKUQVsnLKEP3-r3cp2kXyPRjF9t9uFDrLJ79nkVlOZOlmgcdLeKPMSgipiphx7jLUWvLub1LeAfE7CezhZPkfQ2zMsPfV6sQqozG_7i0d_rG1xRlu6AXcn79wM'
};
var request = http.Request('GET', Uri.parse('https://waaasil.com/care/api/all-complaints'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

}