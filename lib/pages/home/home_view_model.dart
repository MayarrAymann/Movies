import 'package:flutter/material.dart';
import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/movie_model.dart';
import 'package:movies/core/constants.dart';
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
      
      var favoriteMovies = await FirestoreUtils.getDataFromFirestore();
      
      for (int i = 0; i < _popularMovies.length; i++) {
        if (favoriteMovies.contains(_popularMovies[i].id)) {
          _popularMovies[i].isFavorite = true;
        }

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
      
      var favoriteMovies = await FirestoreUtils.getDataFromFirestore();
      
      for (int i = 0; i < _newReleaseMovies.length; i++) {
        if (favoriteMovies.contains(_newReleaseMovies[i].id)) {
          _newReleaseMovies[i].isFavorite = true;
        }
      }
      
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
      
      var favoriteMovies = await FirestoreUtils.getDataFromFirestore();
      
      for (int i = 0; i < _recommendMovies.length; i++) {
        if (favoriteMovies.contains(_recommendMovies[i].id)) {
          _recommendMovies[i].isFavorite = true;
        }
      }

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
      
      var favoriteMovies = await FirestoreUtils.getDataFromFirestore();
      
      for (int i = 0; i < _similarMovies.length; i++) {
        if (favoriteMovies.contains(_similarMovies[i].id)) {
          _similarMovies[i].isFavorite = true;
        }
      }

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
