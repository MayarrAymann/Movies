import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/details_model.dart';
import '../../../core/constants.dart';
import 'home_details_view.dart';

class SimilarMoviesItem extends StatelessWidget {
  final DetailsModel model;

  const SimilarMoviesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 150,
        height: 350,
        child: Card(
          color: const Color(0xff343534),
          elevation: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
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
                        child: Image.network(
                          "${Constants.imageBaseURL}${model.posterPath}",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            print('bookmarkPressed');
                          },
                          child:
                              Image.asset("assets/images/add_to_bookmark.png")),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/images/star_rate.png"),
                          color: Color(0xffFFBB3B),
                        ),
                        Text(
                          "${model.voteAverage}",
                          style: const TextStyle(
                              color: Colors.white), // Adjust style as needed
                        ),
                      ],
                    ),
                    Text(
                      "${model.title}",
                      style: const TextStyle(
                          color: Colors.white), // Adjust style as needed
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          Constants.getMovieReleaseYear(model.releaseDate!),
                          style: const TextStyle(
                            color: Color(0XFFB5B4B4),
                          ), // Adjust style as needed
                        ),
                        const SizedBox(width: 5),
                        Text(
                          Constants.getMovieDuration(model.runtime!),
                          style: const TextStyle(
                            color: Color(0XFFB5B4B4),
                          ), // Adjust style as needed
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
