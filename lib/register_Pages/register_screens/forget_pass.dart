import 'package:flutter/material.dart';

import 'package:screen_of_enaya/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/resetpass.dart';

class forgetPass extends StatefulWidget {
  //const forgetPass({ Key? key }) : super(key: key);
  @override
  _forgetPassState createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
  final forKey = GlobalKey<FormState>();
  bool loading;

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 10.0,
                    fit: BoxFit.contain,
                    image: AssetImage("images/reset.png"),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              " forget password",
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 30,
          ),
          Form(
            key: forKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.email, "email"),
                    /*validator:(value) => value.isEmpty ||
                                            value == null ||
                                            !validatePassowrdStructure(
                                                passController.text)
                                        ? 'password should contains at \n leats 8 characters \n at least 1 sign'
                                        : null,*/
                    // },
                  ),
                ),
///////////////////////////////////////////////////////////
//* =======================password ======*/
/////////////////////////////////////////////////////////

                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
///////////////////////////////////////////////////////////////////
//*========================== Confirm button =====*/
///////////////////////////////////////////////////////////////////
                  child: RaisedButton(
                    color: Color(0xFF2C3343),
                    child: Text(
                      'Confirm ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (forKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        if (loading = true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => restPass(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                /* GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyHomePage()));
                                      },
                                      child: Container(
                                        child: Text(
                                          'Creat New Account?',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Color(0xFF252B39),
                                          ),
                                        ),
                                      ),
                                    ),*/
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Text(
            "Forget your password ?",
            style: TextStyle(color: Colors.teal, fontSize: 50),
          )
        ],
      ),
    );
  }
}
