import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_detials/more_of_movies.dart';
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          args.originalTitle ?? "",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "${Constants.imageBaseURL}${args.backdropPath}",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 200,
                  top: 70,
                  child: Image.asset("assets/images/play_button.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Text(
                args.originalTitle ?? "",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0 , right: 10.0),
                  child: Text(
                    args.releaseDate ?? "",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  ),
                ),
                Text("7 h 2m" ,style:
                TextStyle(fontSize: 15, color: Colors.grey.shade400) )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0, left: 8.0 , right:8.0),
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("Action",
                              style: TextStyle(fontSize: 20, color: Colors.grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 5.0,
                          ),
                          child: Text(
                             args.overview??"",
                              maxLines: 5,
                              style: TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/Group16.png"),
                              SizedBox(width: 5),
                              Text(
                                "${args.voteAverage}",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.white),
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
            Container(
              color: Color(0XFF282A28),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 5),
                child: Text("More Like This ",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => More_Of_Movies(
                  model: vm.popularMovies[index],
                ),
                itemCount: vm.popularMovies.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
      ),
    );
  }
}
