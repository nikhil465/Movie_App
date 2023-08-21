import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/views/movie_details.dart';
import 'package:movie_app/views/movie_registration.dart';

import '../services/api_calls.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpCall.fetchAllMovies().then((resultMovies) {
      setState(() {
        homeController.movies.value = resultMovies;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie"),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(MovieRegister());
          },
          child: const Icon(Icons.add),
        ),
        body: homeController.movies.isEmpty
            ? const Center(
                child: Text("No Movies Found..."),
              )
            : ListView.builder(
                itemCount: homeController.movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(MovieDetails(index: index));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  //width: 100.0,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      "https://picsum.photos/id/${index + 1}/200/300",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    homeController.movies[index].name
                                        .toString(),
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
