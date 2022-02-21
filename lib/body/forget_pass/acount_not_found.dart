import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/body/main_login/main_login.dart';

class AcountNotFound extends StatelessWidget {
  const AcountNotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(
                "Your acount not found ",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.0,
                  width: MediaQuery.of(context).size.width / 0.44,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      //  scale: 10.0,
                      fit: BoxFit.contain,
                      image: AssetImage(
                          "images/Login_screen/not_found_acount.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "please try again and be sure that your email or phone number are correct ",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                    primary: Colors.teal,
                    minimumSize: Size.fromHeight(50),
                    // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainLogin(),
                                    ),
                                  );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
