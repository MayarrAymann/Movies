import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants.dart';
import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/movie_model.dart';
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
