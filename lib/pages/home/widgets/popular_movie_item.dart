import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../models/details_model.dart';
import '../home_detials/home_details_view.dart';

class PopularMovieItem extends StatelessWidget {
  final DetailsModel model;

  const PopularMovieItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HomeDetailsView.routeName,
                      arguments: model,
                    );
                  },
                  child: Container(
                    width: width,
                    height: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "${Constants.imageBaseURL}${model.backdropPath}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Image.asset("assets/images/play_button.png"),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: 20,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HomeDetailsView.routeName,
                                arguments: model,
                              );
                            },
                            child: Image.network(
                              "${Constants.imageBaseURL}${model.posterPath}",
                              width: 140,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                print('bookmarkPressed');
                              },
                              child: Image.asset(
                                  "assets/images/add_to_bookmark.png")),
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
                            Row(
                              children: [
                                Text(
                                  Constants.getMovieReleaseYear(
                                      model.releaseDate!),
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontSize: 10,
                                      color: const Color(0XFFB5B4B4)),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  Constants.getMovieDuration(
                                      model.runtime ?? 0),
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontSize: 10,
                                      color: const Color(0XFFB5B4B4)),
                                ),
                              ],
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
