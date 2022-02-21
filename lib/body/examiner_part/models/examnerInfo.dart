// To parse this JSON data, do
//
//     final allExams = allExamsFromJson(jsonString);

import 'dart:convert';

AllExams allExamsFromJson(String str) => AllExams.fromJson(json.decode(str));

String allExamsToJson(AllExams data) => json.encode(data.toJson());

class AllExams {
    AllExams({
        this.data,
        this.code,
    });

    List<Datum> data;
    int code;

    factory AllExams.fromJson(Map<String, dynamic> json) => AllExams(
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
        this.status,
        this.notes,
        this.date,
        this.patientId,
        this.providerId,
        this.createdAt,
        this.updatedAt,
        this.tests,
    });

    int id;
    int status;
    String notes;
    DateTime date;
    int patientId;
    int providerId;
    DateTime createdAt;
    DateTime updatedAt;
    List<Test> tests;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        notes: json["notes"],
        date: DateTime.parse(json["date"]),
        patientId: json["patient_id"],
        providerId: json["provider_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "notes": notes,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "patient_id": patientId,
        "provider_id": providerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
    };
}

class Test {
    Test({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;
    Pivot pivot;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    Pivot({
        this.examinationId,
        this.testId,
    });

    int examinationId;
    int testId;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        examinationId: json["examination_id"],
        testId: json["test_id"],
    );

    Map<String, dynamic> toJson() => {
        "examination_id": examinationId,
        "test_id": testId,
    };
}
