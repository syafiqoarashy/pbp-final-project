// To parse this JSON data, do
//
//     final myWatchlist = myWatchlistFromJson(jsonString);

import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
  MyWatchlist({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  Watched watched;
  String title;
  double rating;
  String releaseDate;
  String review;

  factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
    watched: watchedValues.map[json["watched"]]!,
    title: json["title"],
    rating: json["rating"].toDouble(),
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watchedValues.reverse[watched],
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}

enum Watched { YES }

final watchedValues = EnumValues({
  "Yes": Watched.YES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}