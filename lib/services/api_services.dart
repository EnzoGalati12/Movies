import 'dart:convert';

import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/detail_people_model.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/people_popular_model.dart' as personModel;
import 'package:movie_app/models/tv_series_model.dart' as tvModel;

const baseUrl = 'https://api.themoviedb.org/3/';
const key = '?api_key=$apiKey';

class ApiServices {
  Future<Result> getTopRatedMovies() async {
    const endPoint = 'movie/top_rated';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Result.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<Result> getNowPlayingMovies() async {
    const endPoint = 'movie/now_playing';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Result.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<Result> getPopularMovies() async {
    const endPoint = 'movie/popular';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Result.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<Result> getUpcoming() async {
    const endPoint = 'movie/upcoming';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Result.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final endPoint = 'movie/$movieId';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return MovieDetailModel.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<personModel.PersonPopularModel> getPopularPeoples() async {
    const endPoint = 'person/popular';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return personModel.PersonPopularModel.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<DetailPeopleModel> getPeopleDetail(int peopleId) async {
    final endPoint = 'person/$peopleId';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return DetailPeopleModel.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }

  Future<tvModel.TvSeriesModel> getPopularSeries() async {
    const endPoint = 'tv/popular';
    final url = Uri.parse('$baseUrl$endPoint$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return tvModel.TvSeriesModel.fromJson(json);
    }
    throw Exception('Ocorreu um erro');
  }
}
