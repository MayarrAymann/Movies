import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/movie_model.dart';

import '../home_detials/home_details_view.dart';

class NewReleasesMovieItem extends StatelessWidget{
  final MovieModel model;
  const NewReleasesMovieItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,
            HomeDetailsView.routeName,
            arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Image.network(
                "${Constants.imageBaseURL}${model.posterPath}"
            ),
            Image.asset("assets/images/add_to_bookmark.png"),
          ],
        ),
      ),
    );
  }

}