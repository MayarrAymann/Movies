import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/movie_model.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchQuery = '';
  List<MovieModel> _movies = [];

  String get searchQuery => _searchQuery;

  List<MovieModel> get movies => _movies;

  changeSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  getMovies(String query) async {
    _searchQuery = query;

    try {
      var response = await ApiManager.search(query: query);
      _movies = response.results!;

      var favoriteMovies = await FirestoreUtils.getDataFromFirestore();

      for (int i = 0; i < _movies.length; i++) {
        if (favoriteMovies.contains(_movies[i].id)) {
          _movies[i].isFavorite = true;
        }
      }

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
