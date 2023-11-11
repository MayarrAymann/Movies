import 'package:flutter/material.dart';

import '../../core/network_layer/api_manager.dart';
import '../../models/category_model.dart';

class BrowseViewModel extends ChangeNotifier {
  List<GenreModel> _genres = [];

  List<GenreModel> get genres => _genres;

  getGenres() async {
    try {
      var response = await ApiManager.fetchCategories();
      _genres = response.genres;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
