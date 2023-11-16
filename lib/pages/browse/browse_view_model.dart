import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/network_layer/api_manager.dart';
import '../../models/details_model.dart';
import '../../models/genre_model.dart';

class BrowseViewModel extends ChangeNotifier {
  List<GenreModel> _genres = [];
  List<DetailsModel> _movies = [];

  List<GenreModel> get genres => _genres;

  List<DetailsModel> get movies => _movies;

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
      var movies = response.results!;

      _movies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
