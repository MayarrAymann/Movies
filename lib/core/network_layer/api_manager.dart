import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/constants.dart';

import '../../models/category_model.dart';
import '../../models/popular_model.dart';
import '../../models/search_model.dart';

class ApiManager {
  static Future<CategoryModel> fetchCategories() async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.categoriesEndPoint,
      {
        'api_key': Constants.apiKey,
      },
    );

    var response = await http.get(uri);

    print(jsonDecode(response.body));

    CategoryModel categoryModel =
        CategoryModel.fromJson(jsonDecode(response.body));

    return categoryModel;
  }
  
  static Future<Results> fetchPopular() async {
    Uri url = Uri.https(Constants.baseURL, "/3/movie/popular", {
      "api_key": Constants.apiKey,
    });
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    Results popularModel = Results.fromJson(jsonData);
    return popularModel;
  }
  
  static Future<SearchModel> discoverMoviesByGenre(
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

    print('Discover Movies: *-*-*-**-*-*-*-*-*-*-*-*-*-*-*\n${response.body}');

    print('end of response');

    SearchModel searchModel = SearchModel.fromJson(jsonDecode(response.body));
    print('Search Model: $searchModel');
    return searchModel;
  }

  static Future<SearchModel> search({required String query}) async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.searchEndPoint,
      {
        'api_key': Constants.apiKey,
        'query': query,
      },
    );
    var response = await http.get(uri);
    print(response.body);
    SearchModel searchModel = SearchModel.fromJson(jsonDecode(response.body));
    return searchModel;
  }
}