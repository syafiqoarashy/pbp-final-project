// To parse this JSON data, do
//
//     final publication = publicationFromJson(jsonString);

import 'dart:convert';

Publication publicationFromJson(String str) => Publication.fromJson(json.decode(str));

String publicationToJson(Publication data) => json.encode(data.toJson());

class Publication {
  Publication({
    required this.trackId,
    required this.track,
    required this.title,
    required this.authorsName,
    this.submitted,
    this.lastUpdated,
    required this.keywords,
    this.decision,
    this.reviewsSent,
    required this.publicationAbstract,
    required this.location,
    required this.date,
    required this.time,
    required this.chair,
  });

  String trackId;
  String track;
  String title;
  String authorsName;
  DateTime? submitted;
  DateTime? lastUpdated;
  String keywords;
  String? decision;
  String? reviewsSent;
  String publicationAbstract;
  String location;
  DateTime date;
  String time;
  String chair;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
    trackId: json["trackId"],
    track: json["track"],
    title: json["title"],
    authorsName: json["authors_name"],
    submitted: DateTime.parse(json["submitted"]),
    lastUpdated: DateTime.parse(json["lastUpdated"]),
    keywords: json["keywords"],
    decision: json["decision"],
    reviewsSent: json["reviewsSent"],
    publicationAbstract: json["abstract"],
    location: json["location"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    chair: json["chair"],
  );

  Map<String, dynamic> toJson() => {
    "trackId": trackId,
    "track": track,
    "title": title,
    "authors_name": authorsName,
    "submitted": submitted?.toIso8601String(),
    "lastUpdated": lastUpdated?.toIso8601String(),
    "keywords": keywords,
    "decision": decision,
    "reviewsSent": reviewsSent,
    "abstract": publicationAbstract,
    "location": location,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "chair": chair,
  };
}