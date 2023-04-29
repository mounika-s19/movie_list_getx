import 'package:get/get.dart';

import '../../model/movie.dart';

class MovieService extends GetConnect {
  final url = 'https://simplifiedcoding.net/demos/marvel/';

  Future<List<Movie>> getMovies() async {
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return movieFromJson(response.bodyString.toString());
    }
  }
}
