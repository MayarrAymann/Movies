import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/constants.dart';
import 'package:movies/models/details_model.dart';
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
    Uri url = Uri.https(
      Constants.baseURL,
      Constants.popularEndPoint,
      {
        "api_key": Constants.apiKey,
      },
    );

    var response = await http.get(url);
    ResponseModel popular = ResponseModel.fromJson(jsonDecode(response.body));
    return popular;
  }

  static Future<DetailsModel> fetchDetails(int movieId) async {
    Uri url = Uri.https(
      Constants.baseURL,
      '3/movie/$movieId',
      {
        "api_key": Constants.apiKey,
      },
    );

    var response = await http.get(url);
    DetailsModel details = DetailsModel.fromJson(jsonDecode(response.body));
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

  static Future<ResponseModel> fetchNewReleases() async {
    Uri url = Uri.http(
      Constants.baseURL,
      Constants.newReleaseEndPoint,
      {
        "api_key": Constants.apiKey,
      },
    );

    var response = await http.get(url);
    ResponseModel model = ResponseModel.fromJson(jsonDecode(response.body));
    return model;
  }

  static Future<ResponseModel> fetchRecommend() async {
    Uri url = Uri.http(
      Constants.baseURL,
      Constants.topRatedEndPoint,
      {
        "api_key": Constants.apiKey,
      },
    );

    var response = await http.get(url);
    ResponseModel model = ResponseModel.fromJson(jsonDecode(response.body));
    return model;
  }

  static Future<ResponseModel> fetchSimilar(int? movieId) async {
    Uri url = Uri.http(
      Constants.baseURL,
      '3/movie/$movieId/similar',
      {
        "api_key": Constants.apiKey,
      },
    );

    var response = await http.get(url);
    ResponseModel model = ResponseModel.fromJson(jsonDecode(response.body));
    return model;
  }
}
