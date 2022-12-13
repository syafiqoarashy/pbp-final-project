// To parse this JSON data, do
//
//     final publication = publicationFromJson(jsonString);

import 'dart:convert';

EventsParallel eventsParallelFromJson(String str) => EventsParallel.fromJson(json.decode(str));

String eventsParallelToJson(List<EventsParallel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsParallel {
  EventsParallel({
    required this.eventId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.program,
    required this.speaker,
    required this.place,
  });

  String eventId;
  String date;
  String startTime;
  String endTime;
  String program;
  String? speaker;
  String place;

  factory EventsParallel.fromJson(Map<String, dynamic> json) => EventsParallel(
    eventId: json["eventId"],
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    program: json["program"],
    speaker: json["speaker"],
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "program": program,
    "speaker": speaker,
    "place": place,
  };
}