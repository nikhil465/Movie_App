import 'dart:convert';

List<Movie> moviesFromJson(String str) =>
    List<Movie>.from(json.decode(str)['data'].map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<Movie>.from(data.map((e) => e.toJson())));

class Movie {
  String? sId;
  String? name;
  String? genre;
  String? language;

  Movie({this.sId, this.name, this.genre, this.language});

  Movie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    genre = json['genre'];
    language = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['genre'] = genre;
    data['category'] = language;
    return data;
  }
}
