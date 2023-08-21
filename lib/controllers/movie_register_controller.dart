import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/api_calls.dart';
import '../models/movie.dart';

class MovieRegisterController extends GetxController {
  TextEditingController? movieNameController,
      genreController,
      languageController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    movieNameController = TextEditingController(text: "");
    genreController = TextEditingController(text: "");
    languageController = TextEditingController(text: "");
  }

  void registerMovie(context) async {
    var payload = {
      "name": movieNameController!.value.text,
      "genre": genreController!.value.text,
      "language": languageController!.value.text,
    };

    var response = await HttpCall.registerMovie(payload);

    if (response == 200) {
      const snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Registered Successfully!',
          style: TextStyle(color: Colors.white),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
