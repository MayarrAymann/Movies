import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final MovieModel model;

  const MovieItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${Constants.imageBaseURL}${model.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        model.releaseDate!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        model.originalLanguage!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: const Divider(
            height: 2,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
