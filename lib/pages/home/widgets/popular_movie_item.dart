import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/models/popular_model.dart';

class PopularMovieItem extends StatelessWidget{
  final Results results;
  const PopularMovieItem({super.key, required this.results});


  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Column(
        children: [
          ImageSlideshow(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/MovieCover.png",
                    fit: BoxFit.fill,
                  ),
                  GestureDetector(
                      child: Image.asset(
                          "assets/images/play_button.png"
                      ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}