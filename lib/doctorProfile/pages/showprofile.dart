//What after profile view 
import 'package:flutter/material.dart';
import 'package:screen_of_enaya/doctorProfile/models/saveProfile.dart';
import 'package:screen_of_enaya/doctorProfile/services/api_manager.dart';

class ShowProfile extends StatefulWidget {
// const ShowProfile({Key? key}) : super(key: key);
  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  /*ShowProfile(statenum, rolenum, specnum, address, bio) {}
  late String statenum, rolenum, specnum, address, bio;*/
  Future<ProfileSaved> profileModel;
  String id,
      name,
      email,
      userPhone,
      userType,
      otp,
      userNotification,
      status,
      address,
      genderId,
      stateId,
      doctor,
      state,
      gender;
  @override
  void initState() {
    // profileModel = API_Manager().SaveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "name",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Text("ff")
        ],
      ),
    );
  }
}
