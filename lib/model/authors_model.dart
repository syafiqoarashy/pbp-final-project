// To parse this JSON data, do
//
//     final authors = authorsFromJson(jsonString);

import 'dart:convert';

Authors authorsFromJson(String str) => Authors.fromJson(json.decode(str));

String authorsToJson(Authors data) => json.encode(data.toJson());

class Authors {
  Authors({
    required this.submissionId,
    this.firstName,
    required this.lastName,
    this.email,
    required this.country,
    required this.organization,
    required this.personId,
    required this.fullName,
  });

  String submissionId;
  String? firstName;
  String lastName;
  String? email;
  String country;
  String organization;
  int personId;
  String fullName;

  factory Authors.fromJson(Map<String, dynamic> json) => Authors(
    submissionId: json["submission_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    country: json["country"],
    organization: json["organization"],
    personId: json["person_id"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "submission_id": submissionId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country": country,
    "organization": organization,
    "person_id": personId,
    "full_name": fullName,
  };
}
