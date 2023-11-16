import 'package:flutter/material.dart';

import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/movie_model.dart';

class HomeViewModel extends ChangeNotifier{

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  getPopularMovieItem() async {
    try {
      var response = await ApiManager.fetchPopular();
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
  getNewReleasesMovieItem() async {
    try {
      var response = await ApiManager.fetchNewReleases();
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
  getRecommendMovieItem() async {
    try {
      var response = await ApiManager.fetchRecommend();
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