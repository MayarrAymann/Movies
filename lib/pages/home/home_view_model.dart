import 'package:flutter/material.dart';
import '../../core/network_layer/api_manager.dart';
import '../../models/movie_model.dart';

class HomeViewModel extends ChangeNotifier{

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;


  getPopularMovieItem() async {
    try {
      var response = await ApiManager.fetchPopular();
      _movies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
  getNewReleasesMovieItem() async {
    try {
      var response = await ApiManager.fetchNewReleases();
      _movies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
  getRecommendMovieItem() async {
    try {
      var response = await ApiManager.fetchRecommend();
      _movies = response.results!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }



}