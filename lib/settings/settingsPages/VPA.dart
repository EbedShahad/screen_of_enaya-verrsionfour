import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_of_enaya/mainData.dart';
import 'package:screen_of_enaya/settings/settingsPages/editAcounDetails.dart';
import 'package:screen_of_enaya/styleApp.dart';

class VirtualPracticeAcount extends StatefulWidget {
  @override
  VirtualPracticeAcount_State createState() => VirtualPracticeAcount_State();
}

class VirtualPracticeAcount_State extends State<VirtualPracticeAcount> {
 String initialText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VIrtual Practise Acount"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditVpa(
                    "Virtual Practise Name",
                    vPName,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditVirtualPraName(
                              "Virtual Practise Name ", vPName),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  Text("Priamry Acount Details",
                      style: TextStyle(color: tealColor)),
                  EditVpa(
                    " Name :",
                    doctorName,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcountDetials(),
                        ),
                      );
                    },
                  ),
                  EditVpa(
                    "Email Address :",
                    doctorEmail,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailField(),
                        ),
                      );
                    },
                  ),
                  EditVpa(
                    "Password :",
                    doctorPassword,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PassField(),
                        ),
                      );
                    },
                  ),
                  EditVpa(
                    """
Mobile Phone:""",
                    mobilePhone,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcountDetials(),
                        ),
                      );
                    },
                  ),
                  EditVpa(
                    "Address:",
                    adress,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcountDetials(),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  Text("Time Zone Settings",
                      style: TextStyle(color: tealColor)),
                  EditVpa(
                    "Time zone",
                    timeZoneDoc,
                    ontap4: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcountDetials(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              //  child: _editTitleTextField("VG!"),
            ),
          ),
        ],
      ),
      // Container(child: Text("Virtual Pracice Acount ")),
    );
  }
}

class EditVpa extends StatelessWidget {
  String fieldName;
  String intialField;
  Function ontap4;
  EditVpa(this.fieldName, this.intialField, { this.ontap4});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              fieldName,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.grey.shade400),
              onPressed: ontap4(),
            ),
          ],
        ),
        Text(
          intialField,
          style: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

/*Widget editVpa() {
  return
}*/
class EditVirtualPraName extends StatelessWidget {
  String editTitl;
  String tempName;
//Function ontap4;
  EditVirtualPraName(this.editTitl, this.tempName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Virtual Practise Name"),
        backgroundColor: Color(0xFF2C3343),
        /*leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.check),
        ),*/
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                editTitl,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Spacer(),
              /*IconButton(
                icon: Icon(Icons.edit, color: Colors.grey.shade400),
                onPressed: ontap4,
              ),*/
            ],
          ),
          TextField(
            keyboardType: TextInputType.name,
            obscureText: true,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          /*  Text(
            tempName,
            style: TextStyle(color: Colors.grey.shade600),
          ),*/
          Divider(),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("change email Address"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                cursorColor: tealColor,

                // cursorHeight: 2.0,
                //  obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  labelStyle: TextStyle(color: Colors.black),
                  // border: OutlineInputBorder(),
                  labelText: "Enter New Email Address",
                  // hintText: 'Shahad',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextField(
                cursorColor: tealColor,
                // cursorHeight: 2.0,
                //  obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  // border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Enter Current Password",
                  // hintText: 'Shahad',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PassField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("change Password"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                cursorColor: tealColor,

                // cursorHeight: 2.0,
                //  obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  labelStyle: TextStyle(color: Colors.black),
                  // border: OutlineInputBorder(),
                  labelText: "Enter Old Password",
                  // hintText: 'Shahad',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextField(
                cursorColor: tealColor,
                // cursorHeight: 2.0,
                //  obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  // border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Enter new Password",
                  // hintText: 'Shahad',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextField(
                cursorColor: tealColor,
                // cursorHeight: 2.0,
                //  obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  // border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: " Re - Enter new Password",

                  // hintText: 'Shahad',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
