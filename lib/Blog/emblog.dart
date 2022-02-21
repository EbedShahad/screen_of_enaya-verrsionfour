import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmotyBlog extends StatelessWidget {
  // const EmotyBlog({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3343),
        title: Text("Blog"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("images/emptyBlog.png"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "No Blog Posts are available right now ",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
