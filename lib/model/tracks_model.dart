// To parse this JSON data, do
//
//     final tracks = tracksFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Tracks tracksFromJson(String str) => Tracks.fromJson(json.decode(str));
String tracksToJson(List<Tracks> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tracks {
  Tracks({
    required this.symposium,
    required this.title,
  });

  String symposium;
  String title;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    symposium: json["symposium"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "symposium": symposium,
    "title": title,
  };
}
