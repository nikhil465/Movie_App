import 'package:get/get.dart';
import '../services/api_calls.dart';
import '../models/movie.dart';

class HomeController extends GetxController {
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
