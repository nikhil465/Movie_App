import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/controllers/movie_details_controller.dart';
import 'package:movie_app/controllers/movie_register_controller.dart';

class MovieDetails extends StatefulWidget {
  final int index;
  const MovieDetails({super.key, required this.index});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieDetails();
  }
}

class _MovieDetails extends State<MovieDetails> {
  final movieDetailsController = Get.put(MovieDetailsController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Movie"),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Card(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              //width: 100.0,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Theme.of(context).primaryColorDark),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://picsum.photos/id/${widget.index + 1}/200/300",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Movie Name: " +
                    movieDetailsController.movie.value.name.toString(),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Movie Genre: " +
                    movieDetailsController.movie.value.genre.toString(),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Movie Langugage: " +
                    movieDetailsController.movie.value.language.toString(),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            )
          ],
        ),
      ),
    );
  }
}
