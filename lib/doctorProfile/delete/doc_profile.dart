// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// class DocProfile extends StatefulWidget {
//   // const DocProfile({Key? key}) : super(key: key);
//   String pageroute;
//   DocProfile({this.pageroute});

//   @override
//   State<DocProfile> createState() => _DocProfileState();
// }

// class _DocProfileState extends State<DocProfile> {
//   File imageFile;
//   getProfi() //0String userLevel
//   async {
//     var _isLoading;
//     var jsonResponse = null;
//     print("hello  from sign in ");
//     // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     //Map data = {'userName': email, 'password': pass, 'userLevel': userLevel};

//     //print(data);
//     print("hello  from sign in  after share ");

//     var response = await http.put(
//       Uri.parse("http://waaasil.com/care/api/doctors/102"),
//       body: {
//         'id': "102",
//         'name': "doc",
//         'address': "khartoum",
//         'bio': "I belive i can fly ",
//         'state_id': "1",
//         'specialization_id': "1",
//         'role_id': "1",
//         'image': "",
//       },
//     );
// /*address
// bio
// state_id
// specialization_id
// role_id
// image}
//        {'userName': email, 'password': pass, 'userLevel': userLevel);*/
//     /*.post(Uri.parse("http://waaasil.com/care/api/doctors/102"), body: 
//        {'userName': email, 'password': pass, 'userLevel': userLevel}*/

//     print("hello  from sign in  after response ");
//     // print(response);
//     if (response.statusCode == 200) {
//       print("hello   200  ");
//       jsonResponse = json.decode(response.body);
//       print(response.body);
//       print("best print");
//       if (jsonResponse['code'] == 200) {
//         print("jsonResponse != null");
//         print(jsonResponse);
//         setState(() {
//           print("hello   response.. data   ");
//           _isLoading = false;
//         });
//         //sharedPreferences.setString("token", jsonResponse['token']);
//         /* Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (BuildContext context) => sha()),
//             (Route<dynamic> route) => false);*/
//         print("the last  ");
//       } else {
//         print("50000");
//         setState(() {
//           _isLoading = false;
//         });
//         print(response.body);
//       }
//     }
//     /*  _getFromGallery() async {
//       PickedFile pickedFile = await ImagePicker().getImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );

//       if (pickedFile != null) {
//         print("yaaaaa shahad not null");
//         File imageFile = File(pickedFile.path);
//         if (imageFile == null) {
//           print("Image file null");
//         } else {
//           print("not nulllll image file ");
//           getProfi();
//         }
//       } else {
//         print("yaaaaa shahad nulllllllllllll null");
//       }
//     }
// */
//     /* _getFromCamera() async {
//       PickedFile pickedFile = await ImagePicker().getImage(
//         source: ImageSource.camera,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );
//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//       }
//     }*/

//     final _formKey = GlobalKey<FormState>();

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("complete Profile "),
//           centerTitle: true,
//         ),
//         body: Container(
//             child: Column(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RaisedButton(
//                   color: Colors.greenAccent,
//                   onPressed: () {
//                     //  _getFromGallery();
//                   },
//                   child: Text("PICK FROM GALLERY"),
//                 ),
//                 Container(
//                   height: 40.0,
//                 ),
//                 RaisedButton(
//                   color: Colors.lightGreenAccent,
//                   onPressed: () {
//                     //       _getFromCamera();
//                   },
//                   child: Text("PICK FROM CAMERA"),
//                 )
//               ],
//             ),

//             Text("above me"),
//             Container(
//                 child: imageFile == null
//                     ? Container(
//                         alignment: Alignment.center,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             RaisedButton(
//                               color: Colors.greenAccent,
//                               onPressed: () {
//                                 //  _getFromGallery();
//                                 Image.file(
//                                   File(imageFile.path),
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                 );
//                               },
//                               child: Text("PICK FROM GALLERY"),
//                             ),
//                             Container(
//                               height: 40.0,
//                             ),
//                             RaisedButton(
//                               color: Colors.lightGreenAccent,
//                               onPressed: () {
//                                 //       _getFromCamera();
//                               },
//                               child: Text("PICK FROM CAMERA"),
//                             )
//                           ],
//                         ),
//                       )
//                     : Container(
//                         child: Image.file(
//                           imageFile,
//                           width: 100,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       )),
//             /*Image(image:AssetImage()
//                     (imageFile))*/

//             //  image1 != null ? Image.file(image1) : FlutterLogo(),
//             /*  ClipOval(
//             child: image1 != null ? Image.file(image1) : CircleAvatar(),
//           ),*/
//             /*   Tab(
//             text: "name",
//           ),
//           buildButton(
//             title: "pick galary",
//             icon: Icons.image_outlined,
//             onClicked: () => _getFromGallery(),
//           ),
//           buildButton(
//             title: "pick camera",
//             icon: Icons.camera,
//             onClicked: () => _getFromCamera(),
//           ),
//           Container(
//             child: Image.file(
//               imageFile,
//               fit: BoxFit.cover,
//             ),
//           ),*/
//             /*  Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     icon: const Icon(Icons.person),
//                     hintText: 'Enter your address',
//                     labelText: 'Address',
//                   ),
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     icon: const Icon(Icons.phone),
//                     hintText: 'Enter a bio ',
//                     labelText: 'bio',
//                   ),
//                 ),
//                 new Container(
//                     padding: const EdgeInsets.only(left: 150.0, top: 40.0),
//                     child: new RaisedButton(
//                       child: const Text('Submit'),
//                       onPressed: null,
//                     )),
//               ],
//             ),
//           ),*/
//             //       MyCustomForm(),
//           ],
//         )),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// /*Widget buildButton({
//   String title,
//   IconData icon,
//   VoidCallback onClicked,
// }) =>
//     ElevatedButton(
//         onPressed: onClicked,
//         child: Row(
//           children: [
//             Icon(icon, size: 28),
//             SizedBox(
//               width: 16,
//             ),
//             Text(title),
//           ],     ));*/

// // Create a corresponding State class. This class holds data related to the form.
