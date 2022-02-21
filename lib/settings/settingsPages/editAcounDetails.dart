import 'package:flutter/material.dart';

class AcountDetials extends StatefulWidget {
  @override
  _AcountDetialsState createState() => _AcountDetialsState();
}

class _AcountDetialsState extends State<AcountDetials> {
  dynamic newvalue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Acount Details"),
        centerTitle: true,
        backgroundColor: Color(0xFF2C3343),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      ),
                      value: 2,
                      items: [
                        DropdownMenuItem(
                          child: Text("Dr."),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Mr."), value: 3),
                        DropdownMenuItem(child: Text("MRs."), value: 4),
                        DropdownMenuItem(child: Text("Ms."), value: 5),
                      ],
                      onChanged: (value) {
                        setState(() {
                          newvalue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    Container(
                      width: 100,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Shahad',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last  Name",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    Container(
                      width: 80.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Obied',
                        ),
                      ),
                    ),
                    //Text("123"),
                    //Text("123"),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                        value: 2,
                        items: [
                          DropdownMenuItem(
                            child: Text("+249"),
                            value: 2,
                          ),
                          DropdownMenuItem(child: Text("+61"), value: 3),
                          DropdownMenuItem(child: Text("+234"), value: 5),
                          DropdownMenuItem(child: Text("+234"), value: 6),
                          DropdownMenuItem(child: Text("+234"), value: 7),
                        ],
                        onChanged: (value) {
                          setState(() {
                            newvalue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mobile number"),
                    Container(
                      width: 200.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: '98434234562',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address"),
                    Container(
                      width: 200.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Kh.Sudan',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 200.0,
                  child: TextField(
                    cursorColor: Colors.teal,
                    // cursorHeight: 2.0,
                    //  obscureText: true,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      // labelText: "Shahad",
                      hintText: 'street',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country"),
                      DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                        value: 1,
                        items: [
                          DropdownMenuItem(
                            child: Text("Suadn"),
                            value: 1,
                          ),
                          // DropdownMenuItem(child: Text("Sudan"), value: 1),
                          DropdownMenuItem(child: Text("Egypt"), value: 2),
                          DropdownMenuItem(
                              child: Text("Suadi Arabia"), value: 3),
                          DropdownMenuItem(child: Text("Australia"), value: 4),
                          DropdownMenuItem(child: Text("Emarits"), value: 5),
                        ],
                        onChanged: (value) {
                          setState(() {
                            newvalue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State"),
                    Container(
                      width: 200.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'aus',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("City"),
                    Container(
                      width: 150.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Khartoum',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 100.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Pincode',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TimeZone:"),
                    DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      ),
                      value: 1,
                      items: [
                        DropdownMenuItem(
                          child: Text("UTC -8:00 / -7:00"),
                          value: 1,
                        ),
                        // DropdownMenuItem(child: Text("Sudan"), value: 1),
                        DropdownMenuItem(
                            child: Text("UTC -7:00 / -6:00"), value: 2),
                        DropdownMenuItem(
                            child: Text("Hawaii Standard Time"), value: 3),
                        DropdownMenuItem(
                            child: Text("Hawaii-Aleutian Daylight Time"),
                            value: 4),
                        DropdownMenuItem(
                            child: Text("Mountain Daylight Time"), value: 5),
                      ],
                      onChanged: (value) {
                        setState(() {
                          newvalue = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*Container(
        child: ,
      ),*/
/*   Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: DropdownButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.red,
                          ),
                          value: 2,
                          items: [
                            DropdownMenuItem(
                              child: Text("Dr."),
                              value: 2,
                            ),
                            DropdownMenuItem(child: Text("Mr."), value: 3),
                            DropdownMenuItem(child: Text("MRs."), value: 4),
                            DropdownMenuItem(child: Text("Ms."), value: 5)
                          ],
                          onChanged: (value) {
                            setState(() {
                              newvalue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Container(
                        width: 80.0,
                        child: TextField(
                          cursorColor: Colors.teal,
                          // cursorHeight: 2.0,
                          //  obscureText: true,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            // labelText: "Shahad",
                            hintText: 'Shahad',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last  Name",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Container(
                        width: 80.0,
                        child: TextField(
                          cursorColor: Colors.teal,
                          // cursorHeight: 2.0,
                          //  obscureText: true,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            // labelText: "Shahad",
                            hintText: 'Obied',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                        value: 2,
                        items: [
                          DropdownMenuItem(
                            child: Text("+249"),
                            value: 2,
                          ),
                          DropdownMenuItem(child: Text("+61"), value: 3),
                          DropdownMenuItem(child: Text("+234"), value: 5),
                          DropdownMenuItem(child: Text("+234"), value: 6),
                          DropdownMenuItem(child: Text("+234"), value: 7),
                        ],
                        onChanged: (value) {
                          setState(() {
                            newvalue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Mobile number"),
                    Container(
                      width: 50.0,
                      child: TextField(
                        cursorColor: Colors.teal,
                        // cursorHeight: 2.0,
                        //  obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          // labelText: "Shahad",
                          hintText: 'Obied',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    */
