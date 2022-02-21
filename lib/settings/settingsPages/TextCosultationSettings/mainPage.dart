import 'package:flutter/material.dart';

class TextConsultaionSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Consultaion Settings"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: SingleChildScrollView(
        //  controller: ScrollController.b,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    // height: 200.0,
                    //  width: 100.0,
                    child: Image(
                        image: AssetImage("images/VirtualPractiseWeb.png"))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Web Patient Portal ",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        " arnkjfjngkdfkljfdk fdkjndkjgfnm jfjkdjk jkjgfgkjdg kjffngdjknkn kjjnfjkd kjnfdkgj "),
                  ),
                  Text("https://vg1.sfsjsflj.io "),
                  Divider(),
                  Text("Web Patient Portal "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        " arnkjfjngkdfkljfdk fdkjndkjgfnm jfjkdjk jkjgfgkjdg kjffngdjknkn kjjnfjkd kjnfdkgj "),
                  ),
                  Text("https://vg1.sfsjsflj.io "),
                  Text(
                    "Learn More ",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
