import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screen_of_enaya/doctorProfile/models/newsInfo.dart';
import 'package:screen_of_enaya/doctorProfile/services/api_manager.dart';

class DoctorProfile extends StatefulWidget {
  @override
  DoctorProfileState createState() => DoctorProfileState();
}

/**
 * this to copy my result from it 
 */
class DoctorProfileState extends State<DoctorProfile> {
  Future<NewsModel> _newsModel;
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
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("Snap shot results ");
              //  print(snapshot.data.data.doctorProfile.doctor);
              print(snapshot.data.data.doctorProfile.name);
              print(snapshot.data.data.doctorProfile.userType);
              name = snapshot.data.data.doctorProfile.name;
              email = snapshot.data.data.doctorProfile.email;
              userPhone = snapshot.data.data.doctorProfile.userPhone;
              id = (snapshot.data.data.doctorProfile.id).toString();
              userType = snapshot.data.data.doctorProfile.userType;
              otp = snapshot.data.data.doctorProfile.otp;
              userNotification =
                  snapshot.data.data.doctorProfile.userNotification;
              status = snapshot.data.data.doctorProfile.status;
              address = snapshot.data.data.doctorProfile.address;
              // genderId = snapshot.data.data.doctorProfile.genderId as String;
              // stateId = snapshot.data.data.doctorProfile.stateId;
              doctor = snapshot.data.data.doctorProfile.doctor;
              state = snapshot.data.data.doctorProfile.state;
              // gender = snapshot.data.data.doctorProfile.gender as String;

              return Container(
                child: Column(
                  children: [
                    //  Text(snapshot.data.data.doctorProfile.doctor),
                    // Text(snapshot.data.data.doctorProfile.name),
                    Text(name),
                    Text(email),
                    Text(userPhone),
                    Text(userType),
                    Text(id),
                    // Text(name +
                    //         email +
                    //         // userPhone +
                    //         userType +
                    //         otp +
                    //         userNotification +
                    //         // status +
                    //         address
                    //     // genderId +
                    //     // stateId +
                    //     // doctor +
                    //     //state
                    //   //  ),
                    //gender),
                    /*    ListView.builder(
                      
                        itemCount: snapshot.data.data.doctorProfile.doctor,
                        itemBuilder: (context, index) {
                          var article = snapshot.data.articles[index];
                          var formattedTime = DateFormat('dd MMM - HH:mm')
                              .format(article.publishedAt);
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              children: <Widget>[
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        article.urlToImage,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(width: 16),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(formattedTime),
                                      Text(
                                        article.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        article.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
               */
                  ],
                ),
              );
            } else
              return Row(
                children: [
                  Text(snapshot.hasError.toString()),
                  Center(child: CircularProgressIndicator()),
                ],
              );
          },
        ),

        /**
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     */
      ),
    );
  }
}
