import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen_of_enaya/logcons.dart';

class Consultaions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListTile(
              // dense:
              leading: Text("Showing : "),
              title: Text("All Consultaion"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home_work_rounded),
              ),
            ),
            /*         Container(
              child: Row(
                children: [
                  Text("Showing : "),
                  Text("All Consultaion"),
                  //       InkWell(
                  //         onTap: null,
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //                 child: Image(
                  //                     image: AssetImage("images/filtericon.png"))),
                  //             Text("Filter"),
                  //           ],
                  //         ),
                  //       ),
                ],
              ),
            ),
         
         
         
         
         
         
         
         */
            Center(
              child: Container(
                //alignment: Alignment(-1.0, 0.0),
                height: 300.0,
                width: 80.0,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('images/stethoscope.png'),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "You havent log any consultaion ",
                  softWrap: true,
                  maxLines: 4,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              mouseCursor: MouseCursor.defer,
              child: Text(
                "Log Consultaion",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.orange,
            ),
            Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: () => {
                    /*   Navigator.push(
                   MaterialPageRoute(builder: (context) {
                  return LogCons();
                                   
                     },
                     ),*/
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.orange;
                        return Colors
                            .transparent; // Use the component's default.
                      },
                    ),
                  ),
                  child: Text(
                    "Log Consultaion",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*   Column(
      children: [
        Padding(
          padding: ,
          child:
        Row(
          children: [
            Container(
              height: 300.0,
              width: 80.0,
              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('images/stethoscope.png'),
                ),
              ),
            ),
          ],
        ),
        ),
        // Image.asset('images/stethoscope.png', alignment: Alignment.center),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: null,
              child: Text(
                "Click Here",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );*/
  }
}
