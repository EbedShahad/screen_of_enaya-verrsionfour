// To parse this JSON data, do
//
//     final profileSaved = profileSavedFromJson(jsonString);

import 'dart:convert';

ProfileSaved profileSavedFromJson(String str) =>
    ProfileSaved.fromJson(json.decode(str));

String profileSavedToJson(ProfileSaved data) => json.encode(data.toJson());

class ProfileSaved {
  ProfileSaved({
    this.data,
    this.code,
  });

  Data data;
  int code;

  factory ProfileSaved.fromJson(Map<String, dynamic> json) => ProfileSaved(
        data: Data.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.userPhone,
    this.userType,
    this.image,
    this.otp,
    this.userNotification,
    this.status,
    this.address,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.genderId,
    this.stateId,
  });

  int id;
  String name;
  String email;
  String userPhone;
  String userType;
  dynamic image;
  String otp;
  String userNotification;
  String status;
  String address;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int genderId;
  String stateId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userPhone: json["user_phone"],
        userType: json["user_type"],
        image: json["image"],
        otp: json["otp"],
        userNotification: json["user_notification"],
        status: json["status"],
        address: json["address"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        genderId: json["gender_id"],
        stateId: json["state_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "user_phone": userPhone,
        "user_type": userType,
        "image": image,
        "otp": otp,
        "user_notification": userNotification,
        "status": status,
        "address": address,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "gender_id": genderId,
        "state_id": stateId,
      };
}
