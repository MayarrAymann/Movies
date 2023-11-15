import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import '../home_detials/home_details_view.dart';

class RecommendMovieItem extends StatelessWidget {
  final MovieModel model;

  const RecommendMovieItem({Key? key, required this.model}) : super(key: key);

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
                  onTap: () {
                    Navigator.pushNamed(context,
                        HomeDetailsView.routeName,
                        arguments: model);
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "${Constants.imageBaseURL}${model.posterPath}",
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
                           "${model.voteAverage}",
                           style: const TextStyle(color: Colors.white), // Adjust style as needed
                         ),
                       ],
                     ),
                     Text(
                       "${model.title}",
                       style: const TextStyle(color: Colors.white), // Adjust style as needed
                     ),
                     const SizedBox(height: 5),
                     Text(
                       "${model.releaseDate}",
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
