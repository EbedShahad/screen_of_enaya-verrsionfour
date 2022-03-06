import 'dart:convert';
// form validation
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:screen_of_enaya/mainData.dart';

import 'package:screen_of_enaya/app/genral/style_color.dart';
import 'package:screen_of_enaya/app/token/refresh_tomen.dart';
import 'package:screen_of_enaya/body/patient_part/add_new_patient/genrate_password.dart';
import 'package:screen_of_enaya/body/patient_part/add_new_patient/add_medical_info.dart';

class MainaddPatient extends StatefulWidget {
  const MainaddPatient({Key key}) : super(key: key);

  @override
  _MainaddPatientState createState() => _MainaddPatientState();
}

class _MainaddPatientState extends State<MainaddPatient> {
  int _activeStepIndex = 0;
  DateTime selectedDate = DateTime.now();
  String formattedDate;
  String dropBloodValue = "A+";
  var items = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String password = generatePassword();
  bool validatePhoneStructure(String value) {
    String pattern = r'^(?=.*?[0-9]).{9,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    print(formattedDate);
  }

  addPatient(
      String name,
      String email,
      String gender,
      String phone,
      String password,
      String address,
      String material,
      String job,
      String blood,
      String height,
      String date) async {
    print("inside login Signup");
    Map data1 = {
      'name': name,
      'email': email,
      'gender_id': gender,
      'user_phone': phone,
      'password': password,
      'address': address,
      'martial_status': material,
      'job_title': job,
      'blood_group': blood,
      'height': height,
      'date_of_birth': date,
      'provider_id': '25',
    };
// token= await shared.getinitToken();
//     print(" token will be printed $token");
    //done'Authorization': 'Bearer $token'
    String token = coldToken();
    var response1 = await http.post(
        Uri.parse("https://waaasil.com/care/api/new-patient"),
        body: data1,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response1.statusCode == 200) {
      print(response1.body);
      var jsonResponse = await json.decode(response1.body);
      switch (jsonResponse["code"]) {
        case 200:
          print("user found ya shahad");
          print(jsonResponse["data"]);
          // shared.addPatientName(
          //     jsonResponse["data"]["User"]["name"].toString());
          String name=jsonResponse["data"]["User"]["name"];
               String filenum= jsonResponse["data"]["Patient"]["file_number"].toString();
               String pid= jsonResponse["data"]["Patient"]["id"].toString();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PatienMedicalInfo(
                p_name: name,
                p_file_no:filenum,
                p_id:pid,
              ),
            ),
          );
          break;
        case 500:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.teal,
            content: Text('This user Already exist'),
          ));
          print("user found la la la  shahad");
          break;
      }
    } else {
      print(response1.reasonPhrase);
      print(response1.statusCode);
    }
    print("hello  from sign in  after share ");
  }

//part 1
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
//part 2
  TextEditingController material = TextEditingController();
  TextEditingController job = TextEditingController();
  String dropGenderValue = '1';
//part 3
  TextEditingController patinetHeight = TextEditingController();

  TextEditingController pass = TextEditingController();

  // TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Basic information'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: phone,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return "Required";
                    } else {
                      if (!validatePhoneStructure(value)) {
                        return 'Enter Phone number';
                      } else {
                        return null;
                      }
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full House Address',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // TextField(
                //   controller: pass,
                //   obscureText: true,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Password',
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Social info'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Gender : "),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade400))),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: dropGenderValue,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Male'),
                                  value: '1',
                                ),
                                DropdownMenuItem(
                                  child: Text('Female'),
                                  value: '2',
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropGenderValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: material,
                    validator: (value) => value.isEmpty || value == null
                        ? 'material Status'
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'material status',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: job,
                    validator: (value) =>
                        value.isEmpty || value == null ? 'job' : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job title',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Birth date: "),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              //${selectedDate.day}/${selectedDate.month}/${selectedDate.year}
                              child: Row(
                                children: [
                                  Text("Select"),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ))),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('body info'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    maxLength: 5,
                    keyboardType: TextInputType.phone,
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    // ],
                    controller: patinetHeight,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return "Required";
                      } else {
                        return null;
                        // if (!validatePhoneStructure(value)) {
                        //   return 'Enter Phone number';
                        // } else {
                        //   return null;
                        // }
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Patient height',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: material,
                    validator: (value) => value.isEmpty || value == null
                        ? 'material Status'
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'material status',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: job,
                    validator: (value) =>
                        value.isEmpty || value == null ? 'job' : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job title',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Birth date: "),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              //${selectedDate.day}/${selectedDate.month}/${selectedDate.year}
                              child: Row(
                                children: [
                                  Text("Select"),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ))),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Blood Group : "),
                      DropdownButton(
                        value: dropBloodValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropBloodValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: InkWell(child: const Text('Confirm'), onTap: (){
                //  phone.text.isEmpty ? null : () => _onShare(context);
            },),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name : ${name.text}'),
                Text('Email : ${email.text}'),
                Text('Phone number : ${phone.text}'),
                Text('Address : ${address.text}'),
                Text('Password:  $password'),
                Text('Material Status : ${material.text}'),
                Text('Job title : ${job.text}'),
               // Text('PinCode : ${pincode.text}'),
                /*TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
   TextEditingController address = TextEditingController();
//part 2
  TextEditingController material = TextEditingController();
  TextEditingController job = TextEditingController();
  String dropGenderValue = '1'; */
              ],
            )))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Patient Medical record'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _activeStepIndex,
          steps: stepList(),
          onStepContinue: () {
            if (_activeStepIndex < (stepList().length - 1)) {
              setState(() {
                _activeStepIndex += 1;
              });
            } else {
              print('Submited');
            }
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }

            setState(() {
              _activeStepIndex -= 1;
            });
          },
          onStepTapped: (int index) {
            setState(() {
              _activeStepIndex = index;
            });
          },
          //(context, {onStepContinue, onStepCancel})
          controlsBuilder: (onStepContinue, onStepCancel) {
            final isLastStep = _activeStepIndex == stepList().length - 1;
            return Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("object");
                      },
                      child: (isLastStep)
                          ? InkWell(
                              child: const Text('Submit'),
                              onTap: () {
                                print(password);
                                addPatient(
                                    name.text,
                                    email.text,
                                    dropGenderValue,
                                    phone.text,
                                    password,
                                    address.text,
                                    material.text,
                                    job.text,
                                    dropBloodValue,
                                    patinetHeight.text,
                                    formattedDate);
                              },
                            )
                          : const Text('Next'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (_activeStepIndex > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print("onStepCancel");
                        },
                        child: const Text('Back'),
                      ),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
//   void _onShare(BuildContext context) 
//   async {
//     final box = context.findRenderObject() as RenderBox;
//     await Share.share(password+mobilePhone,
//         //subject: link,
//         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//   }
// }


}

