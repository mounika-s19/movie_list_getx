import 'package:get/get.dart';
import 'package:getx_api_sample/app/model/top_rated_movie.dart';

import '../../../../config.dart';
import '../../../constants/app_url.dart';
import '../../../network/service/movie_type_services.dart';

class TopRatedController extends GetxController with StateMixin<List<ResultTop>> {
  final MovieTypeServices _topMovieService = MovieTypeServices();

  getPopularMovies() async {
    try {
      final Map<String, dynamic> queryParameters = {"api_key": Config.key};
      final topRated = await _topMovieService.getTopRated(
        AppUrl.getTopRatedMovie,
        queryParameters: queryParameters,
      );

      change(topRated, status: RxStatus.success());
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
