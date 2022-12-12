// To parse this JSON data, do
//
//     final speakers = speakersFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final speakers = speakersFromJson(jsonString);

import 'dart:convert';

List<Speakers> speakersFromJson(String str) =>
    List<Speakers>.from(json.decode(str).map((x) => Speakers.fromJson(x)));

String speakersToJson(List<Speakers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Speakers {
  Speakers({
    required this.id,
    required this.name,
    required this.affiliation,
    required this.country,
    required this.type,
    required this.profile,
    required this.storagePath,
    required this.speechTitle,
    this.speechAbstract,
    required this.time,
    required this.room,
    required this.symposium,
  });

  int id;
  String name;
  String affiliation;
  String country;
  String type;
  String profile;
  String storagePath;
  String speechTitle;
  String? speechAbstract;
  String time;
  String room;
  String symposium;

  factory Speakers.fromJson(Map<String, dynamic> json) => Speakers(
        id: json["id"],
        name: json["name"],
        affiliation: json["affiliation"],
        country: json["country"],
        type: json["type"],
        profile: json["profile"],
        storagePath: json["storagePath"],
        speechTitle: json["speechTitle"],
        speechAbstract: json["speechAbstract"],
        time: json["time"],
        room: json["room"],
        symposium: json["symposium"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "affiliation": affiliation,
        "country": country,
        "type": type,
        "profile": profile,
        "storagePath": storagePath,
        "speechTitle": speechTitle,
        "speechAbstract": speechAbstract,
        "time": time,
        "room": room,
        "symposium": symposium,
      };
}
