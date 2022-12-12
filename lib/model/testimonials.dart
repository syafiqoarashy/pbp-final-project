// To parse this JSON data, do
//
//     final testimonials = testimonialsFromJson(jsonString);

import 'dart:convert';

List<Testimonials> testimonialsFromJson(String str) => List<Testimonials>.from(json.decode(str).map((x) => Testimonials.fromJson(x)));

String testimonialsToJson(List<Testimonials> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testimonials {
  Testimonials({
    required this.username,
    required this.content,
    required this.institute,
  });

  String username;
  String content;
  String institute;

  factory Testimonials.fromJson(Map<String, dynamic> json) => Testimonials(
    username: json["username"],
    content: json["content"],
    institute: json["institute"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "content": content,
    "institute": institute,
  };
}
