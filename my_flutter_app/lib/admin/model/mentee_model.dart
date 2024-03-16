// To parse this JSON data, do
//
//     final mentees = menteesFromMap(jsonString);

import 'dart:convert';

Mentees menteesFromMap(String str) => Mentees.fromMap(json.decode(str));

String menteesToMap(Mentees data) => json.encode(data.toMap());

class Mentees {
  bool? error;
  String? message;
  List<Mentee>? mentees;

  Mentees({
    this.error,
    this.message,
    this.mentees,
  });

  factory Mentees.fromMap(Map<String, dynamic> json) => Mentees(
        error: json["error"],
        message: json["message"],
        mentees: json["mentees"] == null
            ? []
            : List<Mentee>.from(json["mentees"]!.map((x) => Mentee.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "mentees": mentees == null
            ? []
            : List<dynamic>.from(mentees!.map((x) => x.toMap())),
      };
}

class Mentee {
  String? id;
  String? userType;
  String? email;
  String? name;
  List<String>? skills;
  dynamic gender;
  String? location;
  dynamic linkedin;
  dynamic portofolio;
  String? photoUrl;
  String? about;
  dynamic accountNumber;
  dynamic accountName;
  dynamic rejectReason;

  Mentee({
    this.id,
    this.userType,
    this.email,
    this.name,
    this.skills,
    this.gender,
    this.location,
    this.linkedin,
    this.portofolio,
    this.photoUrl,
    this.about,
    this.accountNumber,
    this.accountName,
    this.rejectReason,
  });

  factory Mentee.fromMap(Map<String, dynamic> json) => Mentee(
        id: json["id"],
        userType: json["userType"],
        email: json["email"],
        name: json["name"],
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        gender: json["gender"],
        location: json["location"],
        linkedin: json["linkedin"],
        portofolio: json["portofolio"],
        photoUrl: json["photoUrl"],
        about: json["about"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        rejectReason: json["rejectReason"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userType": userType,
        "email": email,
        "name": name,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "gender": gender,
        "location": location,
        "linkedin": linkedin,
        "portofolio": portofolio,
        "photoUrl": photoUrl,
        "about": about,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "rejectReason": rejectReason,
      };
}
