import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/constants.dart';

import '../../models/category_model.dart';

class ApiManager {
  static Future<CategoryModel> fetchCategories() async {
    Uri uri = Uri.https(
      Constants.baseURL,
      Constants.categoriesEndPoint,
      <String, String>{
        'api_key': Constants.apiKey,
      },
    );

    var response = await http.get(uri);

    print(jsonDecode(response.body));

    CategoryModel categoryModel =
        CategoryModel.fromJson(jsonDecode(response.body));

    return categoryModel;
  }
}
