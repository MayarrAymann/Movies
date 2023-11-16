import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../models/details_model.dart';
import '../home_detials/home_details_view.dart';

class NewReleasesMovieItem extends StatelessWidget {
  final DetailsModel model;

  const NewReleasesMovieItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeDetailsView.routeName,
            arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
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
              child:
                  Image.network("${Constants.imageBaseURL}${model.posterPath}"),
            ),
            GestureDetector(
                onTap: () {
                  print('bookmarkPressed');
                },
                child: Image.asset("assets/images/add_to_bookmark.png")),
          ],
        ),
      ),
    );
  }
}