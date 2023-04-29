import 'package:get/get.dart';

import '../../../model/movie.dart';
import '../../../network/service/movie_service.dart';

class HomeController extends GetxController with StateMixin<List<Movie>> {
  final MovieService _movieService = MovieService();

  getMovies() async {
    try {
      final movies = await _movieService.getMovies();
      change(movies, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getMovies();

    super.onInit();
  }
}
