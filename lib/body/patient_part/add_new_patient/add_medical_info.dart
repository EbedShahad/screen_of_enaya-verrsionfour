//to add medical information for patient 
// i must add req filed with form 

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/register_Pages/register_screens/input_decor.dart';
import 'package:screen_of_enaya/doctorProfile/pages/patient_visit_done/add_visit.dart';
import 'package:screen_of_enaya/main.dart';
import 'package:file_picker/file_picker.dart';

class PatienMedicalInfo extends StatefulWidget {
  final String p_name = "ali";
  final String p_id="8";
 
  //  p_name: "ali",
  // p_name: jsonResponse["data"]["User"]["name"],
  //  p_file_no:"P0039"
  final String p_file_no = "P0039";
  // PatienMedicalInfo({Key key, this.p_name,this.p_file_no, this.p_id}) : super(key: key);

  @override
  State<PatienMedicalInfo> createState() => _PatienMedicalInfoState();
}

TextEditingController animalController = TextEditingController();
TextEditingController socialController = TextEditingController();
List<TextEditingController> diseaseController = [];

class _PatienMedicalInfoState extends State<PatienMedicalInfo> {
  /**
    * Smoking, drinking,animals, social_history, patient_id,
diseases[], drugs[]
    */
void initState(){
  
}
  
    AddMedicalInfo() async
     {
      var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNmJjZWEzZGNjNGVjMjdmMDdhODk0MjQzMDFmOTg2ZTE4ZDc0YjBhZWMyOGZhODg0MjAzZGJlNDFkMmY3NGM0OTUyNGM1MTlkZWE0YzUzZGUiLCJpYXQiOjE2NDU0NTI3NTMuMDA4NDgzODg2NzE4NzUsIm5iZiI6MTY0NTQ1Mjc1My4wMDg0ODUwNzg4MTE2NDU1MDc4MTI1LCJleHAiOjE2NDU0NTYzNTIuOTk5ODY1MDU1MDg0MjI4NTE1NjI1LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.O-xycLS2n1ukc2qFIhdN1cS_sLZHepKZX2G1oIbsOyO8vS6zQl-SeIj_Pddk9seGIkdrbkSFxjdKbrVVmi3pFPPpeoDzEaZJji8poYYeaOL0AU6u9AuZqoZfg-p8Dm9t6cLu6dimS2xxrQ6yIaOip23ozPxpLgeXqQgF348IE1Lq20krljKRSZZ7RBckQfl9TZFNxTXpePB2QgJwifvzNsdc-q0_DQyfffG8EXrmJZhHLRKU4YRMGODu9M8G2itV0C6sjCdtQA-z-_HY20svQGl0jbvW281o5u7e86pd6yh8CuIre3Dc-zsC63BqwI9jsA4kU6ImYqS0JGpKWOugU4Xzm-ySr8n9v4dpAuYrekrA3NT5g8PHisqchN-zpkhVTku4t3J7YG2Sn-mFC4uZwBAKydR6KqN54GEg1KUTbW16QM8NfI2MWzoMNGJULs-5smeTD5bhxeXwmuXQcRCI5BESSDkDBssII__IjhsFa1cWAiY2s4zxq8-15gWBouky8_cGOczfJ6aScjcCBFp0605yD-Je4_jnWIfGnogBeoEGaeguJ1xWMW9cu7lksSbRbMAYivCGTFC4sVAZI-SJDnJNb_VOGkluwtZTyb6slDHutgWdxhzuHwSSEPYbH1L6VEg9eSxivFj9LJlas-ROI2L-p-E0090lU5_l-xwEGM8'
};
var request = http.MultipartRequest('POST', Uri.parse('https://waaasil.com/care/api/patient-medical-info'));
request.fields.addAll({
  'patient_id': '8',
  'social_history': 'no one',
  'animals': 'cats',
  'drinking': '1',
  'smoking': '1',
  'diseases[]': '1',
  'drugs[]': '1'
});
request.files.add(await http.MultipartFile.fromPath('attach', '/C:/Users/PAVILION/Desktop/271996026_340009198129519_8510656457623799739_n.jpg'));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

      
    }
  Future getPdfAndUpload() async {
 
  FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true,
    type: FileType.custom,
  allowedExtensions: ['jpg', 'pdf', 'doc'],);

if (result != null) {
  List<File> files = result.paths.map((path) => File(path)).toList();
} else {
  // User canceled the picker
}}
  var smoke;
  var drink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical info "),
        backgroundColor: mainColor,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(widget.p_file_no),
              leading: Icon(Icons.person,color: mainColor,),
              subtitle: Text(widget.p_name),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Smoking :"),
                Row(
                  children: [
                    Text("Yes"),
                    Container(
                      child: Radio(
                        value: "Yes",
                        groupValue: smoke,
                        onChanged: (value) {
                          setState(() {
                            smoke = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("No"),
                    Container(
                      child: Radio(
                        value: "No",
                        groupValue: smoke,
                        onChanged: (value) {
                          setState(() {
                            smoke = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Drinking :"),
                Row(
                  children: [
                    Text("Yes"),
                    Container(
                      child: Radio(
                        value: "Yes",
                        groupValue: drink,
                        onChanged: (value) {
                          setState(() {
                            drink = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("No"),
                    Container(
                      child: Radio(
                        value: "No",
                        groupValue: smoke,
                        onChanged: (value) {
                          setState(() {
                            smoke = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: animalController,
              validator: (value) =>
                  value.isEmpty || value == null ? 'animal' : null,
              decoration:
                  buildInputDecoration(Icons.home, 'Do you have Animals ?'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 3,
              controller: socialController,
              validator: (value) =>
                  value.isEmpty || value == null ? 'Social History' : null,
              decoration: buildInputDecoration(
                  Icons.people, 'what about your social history?'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                         decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight:Radius.circular(30.0),
                            topLeft:Radius.circular(30.0),
                           
                          ),),
                        height: MediaQuery.of(context).size.height / 13,
                        // MediaQuery.of(context).orientation == Orientation.portrait
                        //     ? MediaQuery.of(context).size.height / 1.41
                        //     : MediaQuery.of(context).size.height / 2.50,
                       
                        child: Icon(
                          Icons.sick,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        print("disease");
                        _displayDisease(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 13,
                        child: Icon(
                          Icons.local_pharmacy,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        print("drugs");
                         _displayDrug(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              color: mainColor,
              child: Text("Next",style: TextStyle(color: Colors.white,),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddVisit(
                        //  allStates:jsonResponse["data"]["provider"]["state"],
                        ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:mainColor,
        child: Icon(Icons.attach_file,color: Colors.white,),
        onPressed:() async {
       
        getPdfAndUpload();
        }
      
    ),
    );
  }
}


_displayDisease(BuildContext context) async {
  //i am trying when user add a disea
  return showDialog(
      context: context,
      builder: (context) {
        var counter1=1;
        return AlertDialog(
          title: Text(
            'History of diseases',
            style: TextStyle(color: mainColor),
          ),
          content: Container(
            decoration: BoxDecoration(border: Border.all()),
            child:  ListView.builder(
        itemCount:counter1,
        itemBuilder: (BuildContext context,int index){
          return Column(
            children: [
              TextField(
                  maxLines:1,
                  controller: diseaseController[index],
                  decoration: InputDecoration(
                    hintText: "optional note to patient",
                    border: InputBorder.none,
                  ),
                ),
                Container(child: IconButton(icon: Icon(Icons.add),
                onPressed: (){

                },)),
            ],
          );
            }),
            
          ),
          actions: <Widget>[
            new FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(child: new Text('Cancel')),
                    InkWell(child: new Text('Confirm ')),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

_displayDrug(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'History of drugs',
            style: TextStyle(color: mainColor),
          ),
          content: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              maxLines:1,
              controller:animalController,
              decoration: InputDecoration(
                hintText: "optional note to patient",
                border: InputBorder.none,
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(child: new Text('Cancel')),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(child: new Text('ok ')),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
