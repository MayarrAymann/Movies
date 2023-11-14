import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/movie_model.dart';

import '../home_detials/home_details_view.dart';

class PopularMovieItem extends StatelessWidget {
  final MovieModel model;

  const PopularMovieItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      "${Constants.imageBaseURL}${model.backdropPath}",
                      fit: BoxFit.cover,
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context,HomeDetailsView.routeName ,
                          arguments: model
                          );
                        },
                        child: Image.asset("assets/images/play_button.png")),
                  ],
                ),
                Positioned(
                  bottom: -20,
                  left: 20,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            "${Constants.imageBaseURL}${model.posterPath}",
                            width: 140,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Image.asset("assets/images/add_to_bookmark.png"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100,left: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              model.originalTitle ?? "",
                              style: theme.textTheme.bodyLarge,
                              softWrap: true,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              model.releaseDate ?? "",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontSize: 10,
                                color: const Color(0XFFB5B4B4)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
