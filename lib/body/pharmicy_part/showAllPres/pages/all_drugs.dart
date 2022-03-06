// To parse this JSON data, do
//
//     final allDrugs = allDrugsFromJson(jsonString);

import 'dart:convert';

AllDrugs allDrugsFromJson(String str) => AllDrugs.fromJson(json.decode(str));

String allDrugsToJson(AllDrugs data) => json.encode(data.toJson());

class AllDrugs {
    AllDrugs({
        this.data,
        this.code,
    });

    List<Datum> data;
    int code;

    factory AllDrugs.fromJson(Map<String, dynamic> json) => AllDrugs(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
