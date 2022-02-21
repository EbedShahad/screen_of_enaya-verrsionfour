// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);
import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());
// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

//NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

//String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
    this.code,
  });

  Data data;
  int code;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
    this.doctorProfile,
    this.roles,
    this.states,
    this.specializations,
  });

  DoctorProfile doctorProfile;
  List<Role> roles;
  List<Role> states;
  List<Role> specializations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doctorProfile: DoctorProfile.fromJson(json["doctorProfile"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        states: List<Role>.from(json["states"].map((x) => Role.fromJson(x))),
        specializations: List<Role>.from(
            json["specializations"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctorProfile": doctorProfile.toJson(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
        "specializations":
            List<dynamic>.from(specializations.map((x) => x.toJson())),
      };
}

class DoctorProfile {
  DoctorProfile({
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
    this.doctor,
    this.state,
    this.gender,
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
  dynamic address;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int genderId;
  dynamic stateId;
  dynamic doctor;
  dynamic state;
  Gender gender;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
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
        doctor: json["doctor"],
        state: json["state"],
        gender: Gender.fromJson(json["gender"]),
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
        "doctor": doctor,
        "state": state,
        "gender": gender.toJson(),
      };
}

class Gender {
  Gender({
    this.id,
    this.type,
  });

  int id;
  String type;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.countryId,
  });

  int id;
  String name;
  int createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  int countryId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        countryId: json["country_id"] == null ? null : json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "country_id": countryId == null ? null : countryId,
      };
}
