import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants.dart';
import '../../core/network_layer/api_manager.dart';
import '../../models/details_model.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchQuery = '';
  List<DetailsModel> _movies = [];

  String get searchQuery => _searchQuery;

  List<DetailsModel> get movies => _movies;

  changeSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  getMovies(String query) async {
    _searchQuery = query;

    try {
      var response = await ApiManager.search(query: query);
      var movies = response.results!;

      _movies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
