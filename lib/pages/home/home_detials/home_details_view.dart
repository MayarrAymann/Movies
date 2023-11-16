import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_detials/similarMoviesView.dart';

import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import '../home_view_model.dart';

class HomeDetailsView extends StatelessWidget {
  static String routeName = "home details";

  var vm = HomeViewModel();
  late final MovieModel detailsModel;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieModel;
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          args.originalTitle ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "${Constants.imageBaseURL}${args.backdropPath}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.asset("assets/images/play_button.png"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Text(
                args.originalTitle ?? "",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Text(
                    args.releaseDate ?? "",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  ),
                ),
                Text("7 h 2m",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade400))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "${Constants.imageBaseURL}${args.posterPath}",
                        width: 140,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      Image.asset("assets/images/bookmark.png"),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("Action",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 5.0,
                          ),
                          child: Text(args.overview ?? "",
                              maxLines: 5,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/Group16.png"),
                              const SizedBox(width: 5),
                              Text(
                                "${args.voteAverage}",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SimilarMoviesView(),
          ],
        ),
      ),
    );
  }
}
