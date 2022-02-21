// ignore_for_file: slash_for_doc_comments
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:screen_of_enaya/doctorProfile/constants/strings.dart';
import 'package:screen_of_enaya/doctorProfile/models/newsInfo.dart';
import 'package:screen_of_enaya/doctorProfile/models/saveProfile.dart';
import 'package:screen_of_enaya/doctorProfile/pages/showprofile.dart';
import 'package:screen_of_enaya/doctorProfile/services/api_manager.dart';
import 'package:screen_of_enaya/register_Pages/register_screens/OTP_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {  
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = sharedPreferences.getString("Doctor Name");
  }

  bool _status = true;

  // XFile image;
  File image1;
  // String imagePath;
  // ImagePicker picker = ImagePicker();

  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Future<NewsModel> _newsModel;
  // Future<ProfileSaved> saveprofile;

  dynamic valProvince, valroles, valspec;
  File imageFile;
  // String errMessage = 'Error Uploading Image';
  var _dataProvince;
  var _dataroles;
  var _dataspec;
  var data;
  String id,
      name,
      email,
      userPhone,
      userType,
      otp,
      userNotification,
      address,
      genderId,
      stateId,
      doctor,
      state,
      gender;
  var userName;
  // bool Loading;
  //PickedFile pickedFile;
  final FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();

    if (imageFile == null) return;
    print(imageFile);
    var response1;
  }

// ignore: unused_element
  Future _getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      print("before upload image");
      //  upload();
    }
  }

  // Widget _getData(var jardel) {
  //   return Container(
  //       child: Column(
  //     children: [],
  //   ));
  // }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async {
                  print("Save 123");
                  print(name ??
                      "no name" + addressController.text ??
                      "No adress " + bioController.text ??
                      "no boi " + valProvince.toString() ??
                      "No provi" + valroles.toString() ??
                      "No roles" + valspec.toString() ??
                      "No she");
                  String n1 = name;
                  String n2 = addressController.text;
                  String n3 = bioController.text;
                  String n4 = valProvince.toString();
                  String n5 = valroles.toString();
                  String n6 = valspec.toString();
                  print("this is image file ");
                  print(imageFile);

                  // data = await SaveData(
                  //   n1,
                  //   n2,
                  //   n3,
                  //   n4,
                  //   n5,
                  //   n6,
                  //   imageFile,
                  // );
                  data = await Save11(
                    imageFile,
                  );

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShowProfile()));
                  /*    setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShowProfile(data: data)));
                  });*/
                  //   _status = true;

                  //   // FocusScope.of(context).requestFocus(new FocusNode());

                  //   // imageFile
                  //   /* ShowProfile(valProvince, valroles, valspec,
                  //       addressController.text, bioController.text);*/
                  // });*/
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShowProfile()));
                  setState(() {
                    _status = true;
                    //     FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.teal,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            color: Colors.white,
            child: FutureBuilder<NewsModel>(
                future: _newsModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("Snap shot results ");
                    print(snapshot.data.data.doctorProfile.name);
                    print(snapshot.data.data.doctorProfile.userType);
                    name = snapshot.data.data.doctorProfile.name;
                    email = snapshot.data.data.doctorProfile.email;
                    gender = snapshot.data.data.doctorProfile.gender.type;
                    userPhone = snapshot.data.data.doctorProfile.userPhone;
                    id = (snapshot.data.data.doctorProfile.id).toString();
                    userType = snapshot.data.data.doctorProfile.userType;
                    otp = snapshot.data.data.doctorProfile.otp;
                    var _dataProvince = snapshot.data.data.states;
                    var _dataroles = snapshot.data.data.roles;
                    var _dataspec = snapshot.data.data.specializations;
                    //if (address == null) print(" this data providence    ");
                    return new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        new Container(
                          height: 250.0,
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0, top: 20.0),
                                  child: new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: new Text('PROFILE',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                fontFamily: 'sans-serif-light',
                                                color: Colors.black)),
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: new Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          imageFile != null
                                              ? Container(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  child: Image.file(
                                                    imageFile,
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                  decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    // image: new DecorationImage(
                                                    //   image:
                                                    //       new ExactAssetImage(
                                                    //           'images/as.png'),
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                  ))
                                              : new Container(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                      image:
                                                          new ExactAssetImage(
                                                              'images/as.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 90.0, right: 100.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new CircleAvatar(
                                                backgroundColor: Colors.teal,
                                                radius: 25.0,
                                                child: IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      _getFromGallery();
                                                      // Navigator.of(context)
                                                      //     .pop();
                                                      /*  final XFile image =
                                                          _picker.pickImage(
                                                              source: ImageSource
                                                                  .gallery);*/
                                                    }),
                                              )
                                            ],
                                          )),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Container(
                                        child: Text("Dr . " + userName,
                                            style: TextStyle(fontSize: 18.0)))),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Compelte profile',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            _status
                                                ? _getEditIcon()
                                                : new Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Address',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          // ? _getEditIcon()
                                          // : new Container(),
                                          child: new TextFormField(
                                            initialValue: address,
                                            validator: (value) =>
                                                value.isEmpty || value == null
                                                    ? 'address'
                                                    : null,
                                            controller: addressController,
                                            decoration: const InputDecoration(
                                              hintText: "Enter your address",

                                              //== null ? addresss="Enter Your Name" : ,
                                            ),
                                            enabled: _status,
                                            autofocus: _status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Text(
                                    "State",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: DropdownButtonFormField(
                                    hint: Text("state"),
                                    value: valProvince,
                                    items: _dataProvince.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(item.name),
                                        value: item.id,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        valProvince = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Bio',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextFormField(
                                            controller: bioController,
                                            validator: (value) =>
                                                value.isEmpty || value == null
                                                    ? 'Bio'
                                                    : null,
                                            decoration: const InputDecoration(
                                                hintText: "Enter Bio"),
                                            enabled: _status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: DropdownButtonFormField(
                                              hint: Text(
                                                "specalization",
                                                softWrap: true,
                                              ),
                                              value: valspec,
                                              items: _dataspec.map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item.name),
                                                  value: item.id,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  valspec = value;
                                                });
                                              },
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: DropdownButtonFormField(
                                              hint: Text("role"),
                                              value: valroles,
                                              items: _dataroles.map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item.name),
                                                  value: item.id,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  valroles = value;
                                                });
                                              },
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                _status ? _getActionButtons() : new Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                })));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}

Future Save11(File im) async {
  var data = {
    '_method': 'PUT',
    'role_id': '2',
    'specialization_id': '2',
    'address': 'Arkweet',
    'bio': 'i am ggrttrtgdbhft ',
    'name': 'Banan Babikiir',
    'state_id': '1'
  };

  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://waaasil.com/care/api/doctors/262'));
  request.fields['id'] = '262';
  request.fields['_method'] = 'PUT';
  request.fields['role_id'] = '1';
  request.fields['specialization_id'] = '1';
  request.fields['address'] = 'gabraaaaa';
  request.fields['bio'] = 'ya allah';
  request.fields['name'] = 'BANANAA';
  request.fields['state_id'] = '1';
  request.files.add(await http.MultipartFile.fromPath('image', im.path));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  print(im.path);
  print(im);
  try {
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("S?UCeddssss  Your Data");
    } else {
      print(response.reasonPhrase);
      print("RE SEND Your Data");
      print(response.statusCode);
    }
  } on Exception catch (e, s) {
    print("what happend  ? : " + e.toString());
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
