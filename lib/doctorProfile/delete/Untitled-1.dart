// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   /// Variables
//   File imageFile;

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         RaisedButton(
//                           color: Colors.greenAccent,
//                           onPressed: () {
//                             _getFromGallery();
//                           },
//                           child: Text("PICK FROM GALLERY"),
//                         ),
//                         Container(
//                           height: 40.0,
//                         ),
//                         RaisedButton(
//                           color: Colors.lightGreenAccent,
//                           onPressed: () {
//                             _getFromCamera();
//                           },
//                           child: Text("PICK FROM CAMERA"),
//                         )
//                       ],
//                     ),
//                   )
//                 : Container(
//                     child: Image.file(
//                       imageFile,
//                       fit: BoxFit.cover,
//                     ),
//                   )));
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
// }

          
            
            
            
            
            
            
            
            
//              Expanded(
//               child: new ListView(
//                 //  shrinkWrap: true,
//                 children: <Widget>[
//                   new Container(
//                     height: 250.0,
//                     color: Colors.white,
//                     child: new Column(
//                       children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.only(left: 20.0, top: 20.0),
//                             child: new Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 new Icon(
//                                   Icons.arrow_back_ios,
//                                   color: Colors.black,
//                                   size: 22.0,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 25.0),
//                                   child: new Text('PROFILE',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20.0,
//                                           // fontFamily: 'sans-serif-light',
//                                           color: Colors.black)),
//                                 )
//                               ],
//                             )),
//                         Padding(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: new Stack(
//                             fit: StackFit.loose,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Center(
//                                   child: new Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Container(
//                                           alignment: Alignment.bottomCenter,
//                                           child: imageFile == null
//                                               ? Center(
//                                                   child: new Container(
//                                                       width: 140.0,
//                                                       height: 140.0,
//                                                       decoration:
//                                                           new BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         image:
//                                                             new DecorationImage(
//                                                           image: new ExactAssetImage(
//                                                               'images/as.png'),
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       )),
//                                                 )
//                                               : Center(
//                                                   child: Container(
//                                                     child: Image.file(
//                                                       imageFile,
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                 ),
//                                         ),
//                                         Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: 90.0, right: 100.0),
//                                             child: new Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: <Widget>[
//                                                 new CircleAvatar(
//                                                   backgroundColor: Colors.teal,
//                                                   radius: 25.0,
//                                                   child: new IconButton(
//                                                     onPressed: () {},
//                                                     icon: Icon(
//                                                       Icons.edit,
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             )),
//                                       ]),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Center(child: Container(child: Text("Dr . " + name))),
//                       ],
//                     ),
//                   ),

//                   /*   new Container(
//                     color: Color(0xffFFFFFF),
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: 25.0),
//                       child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Parsonal Information',
//                                         style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       _status
//                                           ? _getEditIcon()
//                                           : new Container(),
//                                     ],
//                                   )
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Bio',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       controller: bioController,
//                                       decoration: const InputDecoration(
//                                         hintText: "bio ",
//                                       ),
//                                       enabled: !_status,
//                                       autofocus: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Address',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       controller: addressController,
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Address"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       //   new DropdownMenuItem(child: child)
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 left: 25.0, right: 25.0, top: 2.0),
//                             child: new Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: <Widget>[
//                                 new Flexible(
//                                   child: Row(
//                                     children: [
//                                       /*   Expanded(
//                                         flex: 2,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 23.0),
//                                           child: DropdownButton(
//                                             hint: Text("Select State"),
//                                             value: _valProvince,
//                                             items: _dataProvince.map((item) {
//                                               return DropdownMenuItem(
//                                                 child: Text(item.name),
//                                                 value: item.id,
//                                               );
//                                             }).toList(),
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 _valProvince = value;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                       ),*/
//                                       /*      Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 25.0,
//                                             right: 25.0,
//                                             top: 2.0),
//                                         child: new Row(
//                                           mainAxisSize: MainAxisSize.max,
//                                           children: <Widget>[
//                                             new Flexible(
//                                               child: Row(
//                                                 children: [
//                                                   Expanded(
//                                                     flex: 2,
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets
//                                                                   .only(
//                                                               top: 23.0),
//                                                       child: DropdownButton(
//                                                         hint: Text(
//                                                             "Select State"),
//                                                         value: _valProvince,
//                                                         items: _dataProvince
//                                                             .map((item) {
//                                                           return DropdownMenuItem(
//                                                             child: Text(
//                                                                 item.name),
//                                                             value: item.id,
//                                                           );
//                                                         }).toList(),
//                                                         onChanged: (value) {
//                                                           setState(() {
//                                                             _valProvince =
//                                                                 value;
//                                                           });
//                                                         },
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                    */
//                                       /*     Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 25.0,
//                                               right: 25.0,
//                                               top: 25.0),
//                                           child: new Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: <Widget>[
//                                               /*  Expanded(
            
//                                                 child: Container(
//                                                     /*  child: new Text(
//                                   'Pin Code',
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold),
//                                 ),*/
//                                                     ),
//                                                 flex: 2,
//                                               ),
                             
                             
                             
                             
//                              */
//                                               Expanded(
//                                                 child: Container(
//                                                     /*  child: new Text(
//                                   'State',
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),*/
//                                                     ),
//                                                 flex: 2,
//                                               ),
//                                             ],
//                                           )),*/
//                                       Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 25.0,
//                                               right: 25.0,
//                                               top: 2.0),
//                                           child: new Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: <Widget>[
//                                               Flexible(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.only(
//                                                       right: 10.0),
//                                                   child: new TextField(
//                                                     decoration:
//                                                         const InputDecoration(
//                                                             hintText:
//                                                                 "Enter Pin Code"),
//                                                     enabled: !_status,
//                                                   ),
//                                                 ),
//                                                 flex: 2,
//                                               ),
//                                               Flexible(
//                                                 child: new TextField(
//                                                   decoration:
//                                                       const InputDecoration(
//                                                           hintText:
//                                                               "Enter State"),
//                                                   enabled: !_status,
//                                                 ),
//                                                 flex: 2,
//                                               ),
//                                             ],
//                                           )),
//                                       !_status
//                                           ? _getActionButtons()
//                                           : new Container(),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),*/
//                 ],
//               ),
//             );
//           } else
//             return Center(
//               child: Row(
//                 children: [
//                   Center(child: Text(snapshot.hasError.toString())),
//                   Center(
//                       child: CircularProgressIndicator(
//                     color: Colors.teal,
//                   )),
//                 ],
//               ),
//             );
//         },
//       ),
//     ));
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     myFocusNode.dispose();
//     super.dispose();
//   }

//   Widget _getActionButtons() {
//     return Padding(
//       padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
//       child: new Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                 child: new Text("Save"),
//                 textColor: Colors.white,
//                 color: Colors.green,
//                 onPressed: () {
//                   setState(() {
//                     _status = true;
//                     FocusScope.of(context).requestFocus(new FocusNode());
//                   });
//                 },
//                 shape: new RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(20.0)),
//               )),
//             ),
//             flex: 2,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                 child: new Text("Cancel"),
//                 textColor: Colors.white,
//                 color: Colors.red,
//                 onPressed: () {
//                   setState(() {
//                     _status = true;
//                     FocusScope.of(context).requestFocus(new FocusNode());
//                   });
//                 },
//                 shape: new RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(20.0)),
//               )),
//             ),
//             flex: 2,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _getEditIcon() {
//     return new GestureDetector(
//       child: new CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: new Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
// }
