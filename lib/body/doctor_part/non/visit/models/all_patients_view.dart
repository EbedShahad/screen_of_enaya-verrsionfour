// // // To parse this JSON data, do
// // To parse this JSON data, do
// //
// //     final allPatientData = allPatientDataFromJson(jsonString);

// import 'dart:convert';

// AllPatientData allPatientDataFromJson(String str) => AllPatientData.fromJson(json.decode(str));

// String allPatientDataToJson(AllPatientData data) => json.encode(data.toJson());

// class  AllPatientData {
//     AllPatientData({
//         this.data,
//         this.code,
//     });

//     List<Datum> data;
//     int code;

//     factory AllPatientData.fromJson(Map<String, dynamic> json) => AllPatientData(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         code: json["code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "code": code,
//     };
// }

// class Datum {
//     Datum({
//         this.id,
//         this.name,
//         this.email,
//         this.userPhone,
//         this.userType,
//         this.image,
//         this.status,
//         this.address,
//         this.genderId,
//         this.stateId,
//         this.emailVerifiedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.patient,
//     });

//     int id;
//     String name;
//     String email;
//     String userPhone;
//     String userType;
//     dynamic image;
//     String status;
//     String address;
//     int genderId;
//     dynamic stateId;
//     dynamic emailVerifiedAt;
//     DateTime createdAt;
//     DateTime updatedAt;
//     Patient patient;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         userPhone: json["user_phone"],
//         userType: json["user_type"],
//         image: json["image"],
//         status: json["status"],
//         address: json["address"],
//         genderId: json["gender_id"],
//         stateId: json["state_id"],
//         emailVerifiedAt: json["email_verified_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "user_phone": userPhone,
//         "user_type": userType,
//         "image": image,
//         "status": status,
//         "address": address,
//         "gender_id": genderId,
//         "state_id": stateId,
//         "email_verified_at": emailVerifiedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "patient": patient == null ? null : patient.toJson(),
//     };
// }

// class Patient {
//     Patient({
//         this.id,
//         this.bloodGroup,
//         this.height,
//         this.dateOfBirth,
//         this.userId,
//         this.providerId,
//         this.fileNumber,
//         this.jobTitle,
//         this.martialStatus,
//         this.createdAt,
//         this.updatedAt,
//     });

//     int id;
//     String bloodGroup;
//     String height;
//     DateTime dateOfBirth;
//     int userId;
//     int providerId;
//     String fileNumber;
//     String jobTitle;
//     String martialStatus;
//     DateTime createdAt;
//     DateTime updatedAt;

//     factory Patient.fromJson(Map<String, dynamic> json) => Patient(
//         id: json["id"],
//         bloodGroup: json["blood_group"],
//         height: json["height"],
//         dateOfBirth: DateTime.parse(json["date_of_birth"]),
//         userId: json["user_id"],
//         providerId: json["provider_id"],
//         fileNumber: json["file_number"],
//         jobTitle: json["job_title"],
//         martialStatus: json["martial_status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "blood_group": bloodGroup,
//         "height": height,
//         "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
//         "user_id": userId,
//         "provider_id": providerId,
//         "file_number": fileNumber,
//         "job_title": jobTitle,
//         "martial_status": martialStatus,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// // //     final newsModel = newsModelFromJson(jsonString);
// // import 'dart:convert';

// // NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

// // String newsModelToJson(NewsModel data) => json.encode(data.toJson());

// // class NewsModel {
// //   NewsModel({
// //     this.status,
// //     this.totalResults,
// //     this.articles,
// //   });

// //   String status;
// //   int totalResults;
// //   List<Article> articles;

// //   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
// //         status: json["status"],
// //         totalResults: json["totalResults"],
// //         articles: List<Article>.from(
// //             json["articles"].map((x) => Article.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "status": status,
// //         "totalResults": totalResults,
// //         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
// //       };
// // }

// // class Article {
// //   Article({
// //     this.source,
// //     this.author,
// //     this.title,
// //     this.description,
// //     this.url,
// //     this.urlToImage,
// //     this.publishedAt,
// //     this.content,
// //   });

// //   Source source;
// //   String author;
// //   String title;
// //   String description;
// //   String url;
// //   String urlToImage;
// //   DateTime publishedAt;
// //   String content;

// //   factory Article.fromJson(Map<String, dynamic> json) => Article(
// //         source: Source.fromJson(json["source"]),
// //         author: json["author"] == null ? null : json["author"],
// //         title: json["title"],
// //         description: json["description"],
// //         url: json["url"],
// //         urlToImage: json["urlToImage"],
// //         publishedAt: DateTime.parse(json["publishedAt"]),
// //         content: json["content"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "source": source.toJson(),
// //         "author": author == null ? null : author,
// //         "title": title,
// //         "description": description,
// //         "url": url,
// //         "urlToImage": urlToImage,
// //         "publishedAt": publishedAt.toIso8601String(),
// //         "content": content,
// //       };
// // }

// // class Source {
// //   Source({
// //     this.id,
// //     this.name,
// //   });

// //   Id id;
// //   Name name;

// //   factory Source.fromJson(Map<String, dynamic> json) => Source(
// //         id: idValues.map[json["id"]],
// //         name: nameValues.map[json["name"]],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": idValues.reverse[id],
// //         "name": nameValues.reverse[name],
// //       };
// // }

// // enum Id { THE_WALL_STREET_JOURNAL }

// // final idValues =
// //     EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});

// // enum Name { THE_WALL_STREET_JOURNAL }

// // final nameValues =
// //     EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     if (reverseMap == null) {
// //       reverseMap = map.map((k, v) => new MapEntry(v, k));
// //     }
// //     return reverseMap;
// //   }
// // }
