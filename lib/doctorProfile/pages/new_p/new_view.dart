import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:screen_of_enaya/app/genral/sharepref.dart';
import 'package:screen_of_enaya/body/patient_part/all_patient_view/pages/HomePatient.dart';



class CompProf extends StatefulWidget {
  // final allStates;
  // const CompProf({Key key}) : super(key: key);
  // const CompProf(
  //     {Key key, this.allStates}) 
  //     : super(key: key); 

  @override
  State<CompProf> createState() => _CompProfState();
}

class _CompProfState extends State<CompProf> {
  File _image;
//  Map _dataProvince = allStates ; 
  void initState() {
    // super.initState();
    if (_image == null) return print("null image");
    print(_image);
   //  var _dataProvince = snapshot.data.data.states;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController bioController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    var _dataProvince = {"khartoum","atbra","Nile"};
    var data;
    Future getCamera() async {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        _image = image as File;
      });
    }

    Future getGallery() async {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        print("before upload image");
        //  upload();
      }
    }

    // var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // setState(() {
    //   _image = image;
    // });}
    Future Save11(File im) async {
      //  Future Save11(String bio,String address,File im) async {
      // var request = http.MultipartRequest(
      //     'POST', Uri.parse('https://waaasil.com/care/api/update-profile'));
      // request.fields.addAll({
      //   '_method': 'put',
      //   'provider_id': '2',
      //   'bio': 'I am a hero doctor',
      //   'address': 'Jabra ',
      //   'state_id': '1'
      // });
      // request.files.add(await http.MultipartFile.fromPath('image',
      //     '/C:/Users/PAVILION/Desktop/271996026_340009198129519_8510656457623799739_n.jpg'));
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // } else {
      //   print(response.reasonPhrase);
      // }

      final shared = sharingData();
      var token = await shared.getinitToken();
 var provider_id =await shared.getinitToken();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://waaasil.com/care/api/update-profile'),
          );
           request.fields.addAll({
        '_method': 'put',
        'provider_id':"2",
        'bio':"no one knows what he can do until he tries",
        'address':"Khartoum",
        'state_id': '1'
      });
      // request.headers.addAll(headers);

      // request.fields['_method'] = 'PUT';
      // request.fields['provider_id'] = '2';
      // request.fields['address'] = 'gabraaaaa';
      // request.fields['bio'] = 'I am a hero doctor';
      // request.fields['state_id'] = '1';
      request.files.add(await http.MultipartFile.fromPath('image', im.path));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print(im.path);
      print(im);
      try {
        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          print("S?UCeddssss  Your Data");
                             Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>HomePatient()));
          /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CompProf(
                //  allStates:jsonResponse["data"]["provider"]["state"],
                  ),),);*/
        } else {
          print(response.reasonPhrase);
          print("RE SEND Your Data");
          print(response.statusCode);
        }
      } on Exception catch (e, s) {
        print("what happend  ? : " + e.toString());
      }
    }

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
                    // print(name ??
                    //     "no name" + addressController.text ??
                    //     "No adress " + bioController.text ??
                    //     "no boi " + valProvince.toString() ??
                    //     "No provi" + valroles.toString() ??
                    //     "No roles" + valspec.toString() ??
                    //     "No she");
                    // String n1 = name;
                    // String n2 = addressController.text;
                    // String n3 = bioController.text;
                    // String n4 = valProvince.toString();
                    // String n5 = valroles.toString();
                    // String n6 = valspec.toString();
                    print("this is image file ");
                    print(_image);
                    data = await Save11(
                      _image,
                    );
                    // //  data = await Save11(bioController.text,
                    // addressController.text,
                    //   _image,
                    // );

                    /*    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShowProfile()));*/
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
                      MaterialPageRoute(builder: (context) => CompProf()));
                    setState(() {
                      //   _status = true;
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

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Image Picker Example'),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(
        //         Icons.landscape,
        //       ),
        //       onPressed: getGallery,
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.refresh),
        //       onPressed: () {
        //         setState(() {
        //           _image = null;
        //         });
        //       },
        //     )
        //   ],
        // ),
   
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // new Container(
            //   height: 250.0,
            //   color: Colors.white,
            //   child: new Column(
            //     children: <Widget>[
            //       Padding(
            //           padding: EdgeInsets.only(left: 20.0, top: 20.0),
            //           child: new Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               new Icon(
            //                 Icons.arrow_back_ios,
            //                 color: Colors.black,
            //                 size: 22.0,
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.only(left: 25.0),
            //                 child: new Text('PROFILE',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20.0,
            //                         fontFamily: 'sans-serif-light',
            //                         color: Colors.black)),
            //               )
            //             ],
            //           )),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: new Stack(fit: StackFit.loose, children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image != null
                              ? Container(
                                  width: 140.0,
                                  height: 140.0,
                                  child: Image.file(
                                    _image,
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
                                          new ExactAssetImage('images/as.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      getGallery();
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
                            child: Text("Dr . " + "userName",
                                style: TextStyle(fontSize: 18.0)))),
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
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            // new Column(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.end,
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: <Widget>[
                            //     _status
                            //         ? _getEditIcon()
                            //         : new Container(),
                            //   ],
                            // )
                          ],
                        )),
                             Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
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
                                // enabled: _status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              // ? _getEditIcon()
                              // : new Container(),
                              child: new TextFormField(
                                // initialValue: "address",
                                validator: (value) =>
                                    value.isEmpty || value == null
                                        ? 'address'
                                        : null,
                                controller: addressController,
                                decoration: const InputDecoration(
                                  hintText: "Enter your address",

                                  //== null ? addresss="Enter Your Name" : ,
                                ),
                                // enabled: _status,
                                // autofocus: _status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Text(
                        "State",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: DropdownButtonFormField(
                        hint: Text("state"),
                        // value: "valProvince",
                        items: _dataProvince.map((item) {
                          return DropdownMenuItem(
                            child:Text("Khartoem"),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            // valProvince = value;
                          });
                        },
                      ),
                    ),
               
                  
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Expanded(
                            //   child: Container(
                            //     child: DropdownButtonFormField(
                            //       hint: Text(
                            //         "specalization",
                            //         softWrap: true,
                            //       ),
                            //       value: valspec,
                            //       items: _dataspec.map((item) {
                            //         return DropdownMenuItem(
                            //           child: Text(item.name),
                            //           value: item.id,
                            //         );
                            //       }).toList(),
                            //       onChanged: (value) {
                            //         setState(() {
                            //           valspec = value;
                            //         });
                            //       },
                            //     ),
                            //   ),
                            //   flex: 2,
                            // ),

                            // Expanded(

                            //   child: Container(
                            //     child: DropdownButtonFormField(
                            //       hint: Text("role"),
                            //       value: valroles,
                            //       items: _dataroles.map((item) {
                            //         return DropdownMenuItem(
                            //           child: Text(item.name),
                            //           value: item.id,
                            //         );
                            //       }).toList(),
                            //       onChanged: (value) {
                            //         setState(() {
                            //           valroles = value;
                            //         });
                            //       },
                            //     ),
                            //   ),
                            //   flex: 2,
                            // ),
                          ],
                        )),
                    // _status ? _getActionButtons() : new Container(),
                    _getActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  //************************************ */

  //  CircleAvatar(
  //   child: Center(
  //     child: _image == null ? Text('Nothing to show.') : Image.file(_image),
  //   ),
  // ),
  // floatingActionButton: FloatingActionButton(
  //   onPressed: getCamera,
  //   child: Icon(Icons.camera_alt),
  // ),

}
