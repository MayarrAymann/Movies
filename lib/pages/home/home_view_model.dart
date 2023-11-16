import 'package:flutter/material.dart';
import '../../core/network_layer/api_manager.dart';
import '../../models/movie_model.dart';

class HomeViewModel extends ChangeNotifier{

  List<MovieModel> _popularMovies = [];
  List<MovieModel> _newReleaseMovies = [];
  List<MovieModel> _recommendMovies = [];
  List<MovieModel> _similarMovies = [];


  List<MovieModel> get popularMovies => _popularMovies;
  List<MovieModel> get newReleaseMovies => _newReleaseMovies;
  List<MovieModel> get recommendMovies => _recommendMovies;
  List<MovieModel> get similarMovies => _similarMovies;

  getPopularMovieItem() async {
    try {
      var response = await ApiManager.fetchPopular();
      _popularMovies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
  getNewReleasesMovieItem() async {
    try {
      var response = await ApiManager.fetchNewReleases();
      _newReleaseMovies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
  getRecommendMovieItem() async {
    try {
      var response = await ApiManager.fetchRecommend();
      _recommendMovies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
  gatSimilarMoviesItem() async {
    try {
      var response = await ApiManager.fetchRecommend();
      _similarMovies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

}