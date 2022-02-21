import 'dart:convert';

// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

Empty emptyFromJson(String str) => Empty.fromJson(json.decode(str));

String emptyToJson(Empty data) => json.encode(data.toJson());

class Empty {
  Empty({
    this.data,
    this.code,
  });

  int data;
  int code;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        data: json["data"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "code": code,
      };
}
