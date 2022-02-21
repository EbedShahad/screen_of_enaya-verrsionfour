import 'package:flutter/material.dart';

class MainPatient extends StatelessWidget {
  // const MainPatient({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Text("Showing :"),
              title: Text("Active patients"),
              trailing: IconButton(
                  onPressed: () {
                    print("Filter");
                  },
                  icon: Icon(Icons.filter)),
            ),
          ],
        ),
      ),
    );
  }
}
