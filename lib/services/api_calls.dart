import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';
import '../utils/const.dart';

class HttpCall {
  static Future<List<Movie>> fetchAllMovies() async {
    try {
      String url = '${Constants.baseUrl}/movie/allMovies';
      print(url);
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var movies = moviesFromJson(response.body);
        print(movies);
        return movies;
      }

      return [];
    } catch (e) {
      print("Error in getting all movies" + e.toString());
      return [];
    }
  }

  static Future registerMovie(var payload) async {
    try {
      String url = '${Constants.baseUrl}/create';
      print(url);

      var response = await http.post(Uri.parse(url), body: payload);
      print(response);
      return response.statusCode;
    } catch (e) {
      print("Error in getting all movies" + e.toString());
      return [];
    }
  }

  static Future getMovie(var id) async {
    try {
      String url = '${Constants.baseUrl}/create/' + id;
      print(url);

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var movies = moviesFromJson(response.body);
        print(movies);
        return movies;
      }

      return [];
    } catch (e) {
      print("Error in getting all movies" + e.toString());
      return [];
    }
  }
}
