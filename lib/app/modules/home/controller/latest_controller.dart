import 'package:get/get.dart';
import 'package:getx_api_sample/app/constants/app_url.dart';
import 'package:getx_api_sample/app/network/service/movie_type_services.dart';

import '../../../../config.dart';
import '../../../model/latest_movie.dart';

class LatestController extends GetxController with StateMixin<LatestMovie> {
  final MovieTypeServices _latestMovieService = MovieTypeServices();

  getLatestMovies() async {
    try {
      final Map<String, dynamic> queryParameters = {"api_key": Config.key};
      final data = await _latestMovieService.getLatest(
        AppUrl.getLatestMovie,
        queryParameters: queryParameters,
      );

      change(data, status: RxStatus.success());
    } catch (e) {
      Get.log(e.toString());
      change(null, status: RxStatus.error());
      rethrow;
    }
  }

  @override
  void onInit() {
    getLatestMovies();
    super.onInit();
  }
}
