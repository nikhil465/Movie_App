import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/api_calls.dart';
import '../models/movie.dart';
import 'home_controller.dart';

class MovieDetailsController extends GetxController {
  final homeController = Get.put(HomeController());
  var movie = Movie().obs;

  void registerMovie(index) async {
    await HttpCall.getMovie(homeController.movies[index].sId.toString())
        .then((value) {
      movie.value = value;
    });
  }
}
