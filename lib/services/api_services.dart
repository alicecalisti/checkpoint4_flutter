import 'dart:convert';

import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/detail_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/review_model.dart';
import 'package:movie_app/pages/movieDetails/movieDetailsPage.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
const key = '?api_key=$apiKey';

class ApiServices {
  Future<Result> getTopRatedMovies() async {
    var endPoint = 'movie/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getNowPlayingMovies() async {
    var endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getUpcomingMovies() async {
    var endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }

  Future<Result> getPopularMovies() async {
    const endPoint = 'movie/popular';
    const url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Details> getDetails(int movieId) async {

    final endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final responseDetail = await http.get(Uri.parse(url), headers: {});
    if (responseDetail.statusCode == 200) {
      return Details.fromJson(jsonDecode(responseDetail.body));
    }
    throw Exception('failed to load movie details');
  }

  Future<ReviewResult> getReviews(int movieId) async {
    final endPoint = 'movie/$movieId/reviews';
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url), headers:{});

    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
