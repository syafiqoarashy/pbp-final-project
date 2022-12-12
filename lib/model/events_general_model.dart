// To parse this JSON data, do
//
//     final publication = publicationFromJson(jsonString);

import 'dart:convert';

EventsGeneral eventsGeneralFromJson(String str) => EventsGeneral.fromJson(json.decode(str));

String eventsGeneralToJson(List<EventsGeneral> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsGeneral {
  EventsGeneral({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.program,
    this.speaker,
    required this.place,
    required this.isParallel,
  });

  String id;
  String date;
  String startTime;
  String endTime;
  String program;
  String? speaker;
  String place;
  String isParallel;

  factory EventsGeneral.fromJson(Map<String, dynamic> json) => EventsGeneral(
    id: json["id"],
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    program: json["program"],
    speaker: json["speaker"],
    place: json["place"],
    isParallel: json["isParallel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "program": program,
    "speaker": speaker,
    "place": place,
    "isParallel": isParallel,
  };
}