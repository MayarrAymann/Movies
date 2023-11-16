import 'package:flutter/material.dart';

import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';

class BrowseViewModel extends ChangeNotifier {
  List<GenreModel> _genres = [];
  List<MovieModel> _movies = [];

  List<GenreModel> get genres => _genres;
  List<MovieModel> get movies => _movies;

  getGenres() async {
    try {
      var response = await ApiManager.fetchCategories();
      _genres = response.genres;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  getMovies(int selectedGenreId) async {
    try {
      var response =
          await ApiManager.discoverMoviesByGenre(genreId: selectedGenreId);
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
