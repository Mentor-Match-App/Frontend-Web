// To parse this JSON data, do
//
//     final mentors = mentorsFromMap(jsonString);

import 'dart:convert';

Mentors mentorsFromMap(String str) => Mentors.fromMap(json.decode(str));

String mentorsToMap(Mentors data) => json.encode(data.toMap());

class Mentors {
  bool? error;
  String? message;
  List<Mentor>? mentors;

  Mentors({
    this.error,
    this.message,
    this.mentors,
  });

  factory Mentors.fromMap(Map<String, dynamic> json) => Mentors(
        error: json["error"],
        message: json["message"],
        mentors: json["mentors"] == null
            ? []
            : List<Mentor>.from(json["mentors"]!.map((x) => Mentor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "mentors": mentors == null
            ? []
            : List<dynamic>.from(mentors!.map((x) => x.toMap())),
      };
}

class Mentor {
  String? id;
  String? userType;
  String? email;
  String? name;
  List<String>? skills;
  String? gender;
  String? location;
  String? linkedin;
  String? portofolio;
  String? photoUrl;
  String? about;
  String? accountNumber;
  String? accountName;
  dynamic rejectReason;

  Mentor({
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

  factory Mentor.fromMap(Map<String, dynamic> json) => Mentor(
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
