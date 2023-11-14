import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/movie_model.dart';

class NewReleasesMovieItem extends StatelessWidget{
  final MovieModel model;
  const NewReleasesMovieItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Image.network(
              "${Constants.imageBaseURL}${model.posterPath}"
          ),
          Image.asset("assets/images/add_to_bookmark.png"),
        ],
      ),
    );
  }

}