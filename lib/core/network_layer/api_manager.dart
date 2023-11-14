import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/constants.dart';
import 'package:movies/models/movies_list_model.dart';

import '../../models/response_model.dart';

class ApiManager {
  static Future<MoviesListModel> fetchCategories() async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.categoriesEndPoint,
      {
        'api_key': Constants.apiKey,
      },
    );

    var response = await http.get(uri);

    MoviesListModel categories =
        MoviesListModel.fromJson(jsonDecode(response.body));

    return categories;
  }

  static Future<ResponseModel> fetchPopular() async {
    Uri url = Uri.https(Constants.baseURL, "/3/movie/popular", {
      "api_key": Constants.apiKey,
    });
    var response = await http.get(url);

    ResponseModel popular = ResponseModel.fromJson(jsonDecode(response.body));

    return popular;
  }
  static Future<ResponseModel> fetchDetails() async {
    Uri url = Uri.https(Constants.baseURL, "3/movie/{movie_id} ", {
      "api_key": Constants.apiKey,
    });
    var response = await http.get(url);

    ResponseModel details = ResponseModel.fromJson(jsonDecode(response.body));

    return details;
  }

  static Future<ResponseModel> discoverMoviesByGenre(
      {required int genreId}) async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.discoverMoviesEndPoint,
      {
        'api_key': Constants.apiKey,
        'with_genres': genreId.toString(),
        'page': '1',
      },
    );

    var response = await http.get(uri);

    ResponseModel moviesByGenre =
        ResponseModel.fromJson(jsonDecode(response.body));

    return moviesByGenre;
  }

  static Future<ResponseModel> search({required String query}) async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.searchEndPoint,
      {
        'api_key': Constants.apiKey,
        'query': query,
      },
    );
    var response = await http.get(uri);

    ResponseModel movies = ResponseModel.fromJson(jsonDecode(response.body));

    return movies;
  }
}