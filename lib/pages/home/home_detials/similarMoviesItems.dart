import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import '../home_view_model.dart';

class SimilarlMoviesItem extends StatelessWidget{
  @override
  var vm = HomeViewModel();
   final MovieModel detailsModel;
   SimilarlMoviesItem({Key? key, required this.detailsModel}) : super(key: key);
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieModel;
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
                      Image.network(
                        "${Constants.imageBaseURL}${args.posterPath}",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.asset("assets/images/add_to_bookmark.png"),
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
                          "${args.voteAverage}",
                          style: const TextStyle(color: Colors.white), // Adjust style as needed
                        ),
                      ],
                    ),
                    Text(
                      "${args.title}",
                      style: const TextStyle(color: Colors.white), // Adjust style as needed
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${args.releaseDate}",
                      style: const TextStyle(
                        color: Color(0XFFB5B4B4),
                      ), // Adjust style as needed
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
