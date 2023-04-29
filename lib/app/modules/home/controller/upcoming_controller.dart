import 'package:get/get.dart';
import 'package:getx_api_sample/app/model/top_rated_movie.dart';
import 'package:getx_api_sample/app/model/upcoming_movie.dart';

import '../../../../config.dart';
import '../../../constants/app_url.dart';
import '../../../network/service/movie_type_services.dart';

class UpComingController extends GetxController with StateMixin<List<ResultUpComing>> {
  final MovieTypeServices _upComingMovieService = MovieTypeServices();

  getUpComingMovie() async {
    try {
      final Map<String, dynamic> queryParameters = {"api_key": Config.key};
      final upComing = await _upComingMovieService.getUpcoming(
        AppUrl.getUpComingMovie,
        queryParameters: queryParameters,
      );

      change(upComing, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getUpComingMovie();
    super.onInit();
  }
}
