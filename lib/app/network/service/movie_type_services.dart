import 'package:get/get.dart';
import 'package:getx_api_sample/app/model/upcoming_movie.dart';

import '../../constants/app_url.dart';
import '../../model/latest_movie.dart';
import '../../model/popular_movie.dart';
import '../../model/top_rated_movie.dart';

class MovieTypeServices extends GetConnect {
  Future<LatestMovie> getLatest(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await get(AppUrl.getLatestMovie, query: queryParameters);
      print(response.body);
      print(response.statusCode);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return latestMovieFromJson(response.bodyString.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ResultPopular>> getPopular(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await get(AppUrl.getPopularMovie, query: queryParameters);
      // print(response.body);
      // print(response.statusCode);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        PopularMovies popularMovies = PopularMovies.fromJson(response.body);
        return popularMovies.results;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ResultTop>> getTopRated(String url, {Map<String, dynamic>? queryParameters}) async {
    final response = await get(AppUrl.getTopRatedMovie, query: queryParameters);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      TopRatedMovie topRated = TopRatedMovie.fromJson(response.body);
      return topRated.results;
    }
  }
   Future<List<ResultUpComing>> getUpcoming(String url, {Map<String, dynamic>? queryParameters}) async {
    final response = await get(AppUrl.getUpComingMovie, query: queryParameters);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      UpcomingMovie upComing = UpcomingMovie.fromJson(response.body);
      return upComing.results;
    }
  }
}
