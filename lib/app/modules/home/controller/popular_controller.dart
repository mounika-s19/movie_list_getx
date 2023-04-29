import 'package:get/get.dart';
import 'package:getx_api_sample/app/constants/app_url.dart';
import 'package:getx_api_sample/app/model/popular_movie.dart';
import 'package:getx_api_sample/app/network/service/movie_type_services.dart';

import '../../../../config.dart';

class PopularController extends GetxController with StateMixin<List<ResultPopular>> {
  final MovieTypeServices _popularMovieService = MovieTypeServices();

  getPopularMovies() async {
    try {
      final Map<String, dynamic> queryParameters = {"api_key": Config.key};
      final popular = await _popularMovieService.getPopular(
        AppUrl.getPopularMovie,
        queryParameters: queryParameters,
      );
      // change(popular, status: RxStatus.success());
      change(popular, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getPopularMovies();
    super.onInit();
  }
}
