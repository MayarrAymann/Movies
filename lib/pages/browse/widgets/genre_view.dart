import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/pages/browse/browse_view_model.dart';
import 'package:movies/pages/browse/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class GenreView extends StatefulWidget {
  static const String routeName = 'genre-view';

  const GenreView({super.key});

  @override
  State<GenreView> createState() => _GenreViewState();
}

class _GenreViewState extends State<GenreView> {
  var vm = BrowseViewModel();

  List<MovieModel> movies = [
    MovieModel(
      adult: false,
      backdropPath: '${Constants.imageBaseURL}/h56edmERPTkey89SqyKu4hINVNy.jpg',
      genreIds: [28, 53],
      id: 575264,
      originalLanguage: 'en',
      originalTitle: 'Mission: Impossible - Dead Reckoning Part One',
      overview: 'Seventh film in the Mission: Impossible series.',
      popularity: 2820.303,
      posterPath: '${Constants.imageBaseURL}/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
      releaseDate: '2023-07-08',
      title: 'Mission: Impossible - Dead Reckoning Part One',
      video: false,
      voteAverage: 7.7,
      voteCount: 2226,
    ),
    MovieModel(
      adult: false,
      backdropPath: '${Constants.imageBaseURL}/h56edmERPTkey89SqyKu4hINVNy.jpg',
      genreIds: [28, 53],
      id: 575264,
      originalLanguage: 'en',
      originalTitle: 'Mission: Impossible - Dead Reckoning Part One',
      overview: 'Seventh film in the Mission: Impossible series.',
      popularity: 2820.303,
      posterPath: '${Constants.imageBaseURL}/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
      releaseDate: '2023-07-08',
      title: 'Mission: Impossible - Dead Reckoning Part One',
      video: false,
      voteAverage: 7.7,
      voteCount: 2226,
    ),
    MovieModel(
      adult: false,
      backdropPath: '${Constants.imageBaseURL}/h56edmERPTkey89SqyKu4hINVNy.jpg',
      genreIds: [28, 53],
      id: 575264,
      originalLanguage: 'en',
      originalTitle: 'Mission: Impossible - Dead Reckoning Part One',
      overview: 'Seventh film in the Mission: Impossible series.',
      popularity: 2820.303,
      posterPath: '${Constants.imageBaseURL}/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
      releaseDate: '2023-07-08',
      title: 'Mission: Impossible - Dead Reckoning Part One',
      video: false,
      voteAverage: 7.7,
      voteCount: 2226,
    ),
    MovieModel(
      adult: false,
      backdropPath: '${Constants.imageBaseURL}/h56edmERPTkey89SqyKu4hINVNy.jpg',
      genreIds: [28, 53],
      id: 575264,
      originalLanguage: 'en',
      originalTitle: 'Mission: Impossible - Dead Reckoning Part One',
      overview: 'Seventh film in the Mission: Impossible series.',
      popularity: 2820.303,
      posterPath: '${Constants.imageBaseURL}/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
      releaseDate: '2023-07-08',
      title: 'Mission: Impossible - Dead Reckoning Part One',
      video: false,
      voteAverage: 7.7,
      voteCount: 2226,
    ),
  ];

  @override
  void initState() {
    super.initState();
    vm.movies.addAll(movies);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(args),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<BrowseViewModel>(
                builder: (context, vm, child) => Expanded(
                  child: (vm.movies.isEmpty)
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Color(0xffB5B4B4),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) =>
                              MovieItem(model: vm.movies[index]),
                          itemCount: vm.movies.length,
                        ),
                        ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
