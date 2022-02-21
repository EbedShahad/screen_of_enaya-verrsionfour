// To parse this JSON data, do
//
//     final patiantDetails = patiantDetailsFromJson(jsonString);

import 'dart:convert';

PatiantDetails patiantDetailsFromJson(String str) => PatiantDetails.fromJson(json.decode(str));

String patiantDetailsToJson(PatiantDetails data) => json.encode(data.toJson());

class PatiantDetails {
    PatiantDetails({
        this.data,
        this.code,
    });

    Data data;
    int code;

    factory PatiantDetails.fromJson(Map<String, dynamic> json) => PatiantDetails(
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
        this.weights,
        this.visits,
        this.examinations,
        this.diagnoses,
        this.medical,
    });

    int id;
    String bloodGroup;
    String height;
    DateTime dateOfBirth;
    int userId;
    int providerId;
    String fileNumber;
    String jobTitle;
    String martialStatus;
    DateTime createdAt;
    DateTime updatedAt;
    User user;
    List<Weight> weights;
    List<Visit> visits;
    List<Diagnosis> examinations;
    List<Diagnosis> diagnoses;
    Medical medical;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        bloodGroup: json["blood_group"],
        height: json["height"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        userId: json["user_id"],
        providerId: json["provider_id"],
        fileNumber: json["file_number"],
        jobTitle: json["job_title"],
        martialStatus: json["martial_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        weights: List<Weight>.from(json["weights"].map((x) => Weight.fromJson(x))),
        visits: List<Visit>.from(json["visits"].map((x) => Visit.fromJson(x))),
        examinations: List<Diagnosis>.from(json["examinations"].map((x) => Diagnosis.fromJson(x))),
        diagnoses: List<Diagnosis>.from(json["diagnoses"].map((x) => Diagnosis.fromJson(x))),
        medical: Medical.fromJson(json["medical"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blood_group": bloodGroup,
        "height": height,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "provider_id": providerId,
        "file_number": fileNumber,
        "job_title": jobTitle,
        "martial_status": martialStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "weights": List<dynamic>.from(weights.map((x) => x.toJson())),
        "visits": List<dynamic>.from(visits.map((x) => x.toJson())),
        "examinations": List<dynamic>.from(examinations.map((x) => x.toJson())),
        "diagnoses": List<dynamic>.from(diagnoses.map((x) => x.toJson())),
        "medical": medical.toJson(),
    };
}

class Diagnosis {
    Diagnosis({
        this.id,
        this.notes,
        this.date,
        this.patientId,
        this.providerId,
        this.createdAt,
        this.updatedAt,
        this.diseases,
        this.status,
        this.tests,
    });

    int id;
    String notes;
    DateTime date;
    int patientId;
    int providerId;
    DateTime createdAt;
    DateTime updatedAt;
    List<DiagnosisDisease> diseases;
    int status;
    List<Test> tests;

    factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
        id: json["id"],
        notes: json["notes"],
        date: DateTime.parse(json["date"]),
        patientId: json["patient_id"],
        providerId: json["provider_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        diseases: json["diseases"] == null ? null : List<DiagnosisDisease>.from(json["diseases"].map((x) => DiagnosisDisease.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        tests: json["tests"] == null ? null : List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "notes": notes,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "patient_id": patientId,
        "provider_id": providerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "diseases": diseases == null ? null : List<dynamic>.from(diseases.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "tests": tests == null ? null : List<dynamic>.from(tests.map((x) => x.toJson())),
    };
}

class DiagnosisDisease {
    DiagnosisDisease({
        this.id,
        this.name,
        this.pivot,
    });

    int id;
    String name;
    PurplePivot pivot;

    factory DiagnosisDisease.fromJson(Map<String, dynamic> json) => DiagnosisDisease(
        id: json["id"],
        name: json["name"],
        pivot: PurplePivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pivot": pivot.toJson(),
    };
}

class PurplePivot {
    PurplePivot({
        this.diagnosisId,
        this.diseaseId,
    });

    int diagnosisId;
    int diseaseId;

    factory PurplePivot.fromJson(Map<String, dynamic> json) => PurplePivot(
        diagnosisId: json["diagnosis_id"],
        diseaseId: json["disease_id"],
    );

    Map<String, dynamic> toJson() => {
        "diagnosis_id": diagnosisId,
        "disease_id": diseaseId,
    };
}

class Test {
    Test({
        this.id,
        this.name,
        this.pivot,
    });

    int id;
    String name;
    TestPivot pivot;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        pivot: TestPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pivot": pivot.toJson(),
    };
}

class TestPivot {
    TestPivot({
        this.examinationId,
        this.testId,
    });

    int examinationId;
    int testId;

    factory TestPivot.fromJson(Map<String, dynamic> json) => TestPivot(
        examinationId: json["examination_id"],
        testId: json["test_id"],
    );

    Map<String, dynamic> toJson() => {
        "examination_id": examinationId,
        "test_id": testId,
    };
}

class Medical {
    Medical({
        this.id,
        this.smoking,
        this.drinking,
        this.animals,
        this.socialHistory,
        this.attach,
        this.patientId,
        this.createdAt,
        this.updatedAt,
        this.diseases,
        this.drugs,
    });

    int id;
    String smoking;
    String drinking;
    String animals;
    String socialHistory;
    String attach;
    int patientId;
    DateTime createdAt;
    DateTime updatedAt;
    List<MedicalDisease> diseases;
    List<Drug> drugs;

    factory Medical.fromJson(Map<String, dynamic> json) => Medical(
        id: json["id"],
        smoking: json["smoking"],
        drinking: json["drinking"],
        animals: json["animals"],
        socialHistory: json["social_history"],
        attach: json["attach"],
        patientId: json["patient_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        diseases: List<MedicalDisease>.from(json["diseases"].map((x) => MedicalDisease.fromJson(x))),
        drugs: List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "smoking": smoking,
        "drinking": drinking,
        "animals": animals,
        "social_history": socialHistory,
        "attach": attach,
        "patient_id": patientId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "diseases": List<dynamic>.from(diseases.map((x) => x.toJson())),
        "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
    };
}

class MedicalDisease {
    MedicalDisease({
        this.id,
        this.name,
        this.pivot,
    });

    int id;
    String name;
    FluffyPivot pivot;

    factory MedicalDisease.fromJson(Map<String, dynamic> json) => MedicalDisease(
        id: json["id"],
        name: json["name"],
        pivot: FluffyPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pivot": pivot.toJson(),
    };
}

class FluffyPivot {
    FluffyPivot({
        this.medicalId,
        this.diseaseId,
    });

    int medicalId;
    int diseaseId;

    factory FluffyPivot.fromJson(Map<String, dynamic> json) => FluffyPivot(
        medicalId: json["medical_id"],
        diseaseId: json["disease_id"],
    );

    Map<String, dynamic> toJson() => {
        "medical_id": medicalId,
        "disease_id": diseaseId,
    };
}

class Drug {
    Drug({
        this.id,
        this.name,
        this.pivot,
    });

    int id;
    String name;
    DrugPivot pivot;

    factory Drug.fromJson(Map<String, dynamic> json) => Drug(
        id: json["id"],
        name: json["name"],
        pivot: DrugPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pivot": pivot.toJson(),
    };
}

class DrugPivot {
    DrugPivot({
        this.medicalId,
        this.drugId,
    });

    int medicalId;
    int drugId;

    factory DrugPivot.fromJson(Map<String, dynamic> json) => DrugPivot(
        medicalId: json["medical_id"],
        drugId: json["drug_id"],
    );

    Map<String, dynamic> toJson() => {
        "medical_id": medicalId,
        "drug_id": drugId,
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.userPhone,
        this.userType,
        this.image,
        this.status,
        this.address,
        this.genderId,
        this.stateId,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String email;
    String userPhone;
    String userType;
    dynamic image;
    String status;
    String address;
    int genderId;
    dynamic stateId;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userPhone: json["user_phone"],
        userType: json["user_type"],
        image: json["image"],
        status: json["status"],
        address: json["address"],
        genderId: json["gender_id"],
        stateId: json["state_id"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "user_phone": userPhone,
        "user_type": userType,
        "image": image,
        "status": status,
        "address": address,
        "gender_id": genderId,
        "state_id": stateId,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Visit {
    Visit({
        this.id,
        this.visitDate,
        this.notes,
        this.attach,
        this.patientId,
        this.providerId,
        this.createdAt,
        this.updatedAt,
        this.compliants,
    });

    int id;
    DateTime visitDate;
    String notes;
    String attach;
    int patientId;
    int providerId;
    DateTime createdAt;
    DateTime updatedAt;
    List<Compliant> compliants;

    factory Visit.fromJson(Map<String, dynamic> json) => Visit(
        id: json["id"],
        visitDate: DateTime.parse(json["visit_date"]),
        notes: json["notes"],
        attach: json["attach"],
        patientId: json["patient_id"],
        providerId: json["provider_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        compliants: List<Compliant>.from(json["compliants"].map((x) => Compliant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "visit_date": "${visitDate.year.toString().padLeft(4, '0')}-${visitDate.month.toString().padLeft(2, '0')}-${visitDate.day.toString().padLeft(2, '0')}",
        "notes": notes,
        "attach": attach,
        "patient_id": patientId,
        "provider_id": providerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "compliants": List<dynamic>.from(compliants.map((x) => x.toJson())),
    };
}

class Compliant {
    Compliant({
        this.id,
        this.name,
        this.pivot,
    });

    int id;
    Name name;
    CompliantPivot pivot;

    factory Compliant.fromJson(Map<String, dynamic> json) => Compliant(
        id: json["id"],
        name: nameValues.map[json["name"]],
        pivot: CompliantPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "pivot": pivot.toJson(),
    };
}

enum Name { NECK_PAIN, BACK_PAIN }

final nameValues = EnumValues({
    "Back Pain": Name.BACK_PAIN,
    "Neck pain": Name.NECK_PAIN
});

class CompliantPivot {
    CompliantPivot({
        this.visitId,
        this.complaintId,
    });

    int visitId;
    int complaintId;

    factory CompliantPivot.fromJson(Map<String, dynamic> json) => CompliantPivot(
        visitId: json["visit_id"],
        complaintId: json["complaint_id"],
    );

    Map<String, dynamic> toJson() => {
        "visit_id": visitId,
        "complaint_id": complaintId,
    };
}

class Weight {
    Weight({
        this.id,
        this.weight,
        this.date,
        this.patientId,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String weight;
    DateTime date;
    int patientId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        id: json["id"],
        weight: json["weight"],
        date: DateTime.parse(json["date"]),
        patientId: json["patient_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "patient_id": patientId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
