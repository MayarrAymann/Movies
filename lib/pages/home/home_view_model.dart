import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';

import '../../core/network_layer/api_manager.dart';
import '../../models/details_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<DetailsModel> _popularMovies = [];
  List<DetailsModel> _newReleaseMovies = [];
  List<DetailsModel> _recommendMovies = [];
  List<DetailsModel> _similarMovies = [];

  List<DetailsModel> get popularMovies => _popularMovies;

  List<DetailsModel> get newReleaseMovies => _newReleaseMovies;

  List<DetailsModel> get recommendMovies => _recommendMovies;

  List<DetailsModel> get similarMovies => _similarMovies;

  getPopularMovies() async {
    try {
      var response = await ApiManager.fetchPopular();
      var movies = response.results!;

      _popularMovies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  getNewReleasesMovies() async {
    try {
      var response = await ApiManager.fetchNewReleases();
      var movies = response.results!;

      _newReleaseMovies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  getRecommendMovies() async {
    try {
      var response = await ApiManager.fetchRecommend();
      var movies = response.results!;

      _recommendMovies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  getSimilarMovies(int? movieId) async {
    try {
      var response = await ApiManager.fetchSimilar(movieId!);
      var movies = response.results!;

      _similarMovies = await Constants.getDetails(movies);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
