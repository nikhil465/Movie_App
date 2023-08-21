import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_register_controller.dart';

class MovieRegister extends StatefulWidget {
  const MovieRegister({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieRegister();
  }
}

class _MovieRegister extends State<MovieRegister> {
  final movieRegController = Get.put(MovieRegisterController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Movie"),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(
                  Icons.movie_creation_outlined,
                  size: 100,
                  color: Theme.of(context).primaryColorDark,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: movieRegController.movieNameController,
                    textAlignVertical: TextAlignVertical.bottom,
                    autofocus: false,
                    validator: (value) {
                      if (value == "") {
                        return "Please Enter Movie Name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Movie Name",
                        border: const OutlineInputBorder(),
                        suffixIcon: Container(
                          child: const Icon(Icons.movie),
                        )),
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: movieRegController.genreController,
                    textAlignVertical: TextAlignVertical.bottom,
                    autofocus: false,
                    validator: (value) {
                      if (value == "") {
                        return "Please Enter Genre";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Genre",
                        border: const OutlineInputBorder(),
                        suffixIcon: Container(
                          child: const Icon(Icons.movie),
                        )),
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: movieRegController.languageController,
                    textAlignVertical: TextAlignVertical.bottom,
                    autofocus: false,
                    validator: (value) {
                      if (value == "") {
                        return "Please Enter Language";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: "Language",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.movie)),
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                movieRegController.registerMovie(context);
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
