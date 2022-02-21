// To parse this JSON data, do
//
//     final allPrescription = allPrescriptionFromJson(jsonString);

import 'dart:convert';

AllPrescription allPrescriptionFromJson(String str) => AllPrescription.fromJson(json.decode(str));

String allPrescriptionToJson(AllPrescription data) => json.encode(data.toJson());

class AllPrescription {
    AllPrescription({
        this.data,
        this.code,
    });

    List<Datum> data;
    int code;

    factory AllPrescription.fromJson(Map<String, dynamic> json) => AllPrescription(
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
        this.date,
        this.drugId,
        this.quantity,
        this.discription,
        this.status,
        this.patientId,
        this.providerId,
        this.createdAt,
        this.updatedAt,
        this.patient,
    });

    int id;
    DateTime date;
    int drugId;
    int quantity;
    String discription;
    int status;
    int patientId;
    int providerId;
    DateTime createdAt;
    DateTime updatedAt;
    Patient patient;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        drugId: json["drug_id"],
        quantity: json["quantity"],
        discription:json["discription"],
        status: json["status"],
        patientId: json["patient_id"],
        providerId: json["provider_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        patient: Patient.fromJson(json["patient"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "drug_id": drugId,
        "quantity": quantity,
        "discription":discription,
        "status": status,
        "patient_id": patientId,
        "provider_id": providerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "patient": patient.toJson(),
    };
}

// enum Discription { EVE, TWO_TIMES_FOR_ADYA, TWO_TIMES_ADAY_AFTER_LUNCH, ONE_EVERY_MORNING }

// final discriptionValues = EnumValues({
//     "eve": Discription.EVE,
//     "one every morning": Discription.ONE_EVERY_MORNING,
//     "two times aday after lunch": Discription.TWO_TIMES_ADAY_AFTER_LUNCH,
//     "two times for adya": Discription.TWO_TIMES_FOR_ADYA
// });

class Patient {
    Patient({
        this.id,
        this.bloodGroup,
        this.height,
        this.dateOfBirth,
        this.userId,
        this.providerId,
        this.fileNumber,
        this.jobTitle,
        this.martialStatus,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    int id;
    BloodGroup bloodGroup;
    String height;
    DateTime dateOfBirth;
    int userId;
    int providerId;
    String fileNumber;
    JobTitle jobTitle;
    MartialStatus martialStatus;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        bloodGroup: bloodGroupValues.map[json["blood_group"]],
        height: json["height"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        userId: json["user_id"],
        providerId: json["provider_id"],
        fileNumber: json["file_number"],
        jobTitle: jobTitleValues.map[json["job_title"]],
        martialStatus: martialStatusValues.map[json["martial_status"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blood_group": bloodGroupValues.reverse[bloodGroup],
        "height": height,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "provider_id": providerId,
        "file_number": fileNumber,
        "job_title": jobTitleValues.reverse[jobTitle],
        "martial_status": martialStatusValues.reverse[martialStatus],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

enum BloodGroup { A, BLOOD_GROUP_A, AB }

final bloodGroupValues = EnumValues({
    "a": BloodGroup.A,
    "AB+": BloodGroup.AB,
    "A": BloodGroup.BLOOD_GROUP_A
});

enum JobTitle { ARTISAN, ENGINNER, HHHHH }

final jobTitleValues = EnumValues({
    "Artisan": JobTitle.ARTISAN,
    "enginner": JobTitle.ENGINNER,
    "hhhhh": JobTitle.HHHHH
});

enum MartialStatus { BACHELOR, BECHALOR, GGGGG }

final martialStatusValues = EnumValues({
    "Bachelor": MartialStatus.BACHELOR,
    "bechalor": MartialStatus.BECHALOR,
    "ggggg": MartialStatus.GGGGG
});

class User {
    User({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
