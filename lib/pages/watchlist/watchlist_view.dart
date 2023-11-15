import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/network_layer/firebase_utils.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/pages/browse/widgets/movie_item.dart';

import '../../core/constants.dart';
import '../home/home_detials/home_details_view.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  @override
  void initState() {
    super.initState();
    FirestoreUtils.addDataToFirestore(
      MovieModel(
        adult: false,
        backdropPath:
            '${Constants.imageBaseURL}/h56edmERPTkey89SqyKu4hINVNy.jpg',
        genreIds: [28, 53],
        id: 575264,
        originalLanguage: 'en',
        originalTitle: 'Mission: Impossible - Dead Reckoning Part One',
        overview: 'Seventh film in the Mission: Impossible series.',
        popularity: 2820,
        posterPath: '${Constants.imageBaseURL}/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
        releaseDate: '2023-07-08',
        title: 'Mission: Impossible - Dead Reckoning Part One',
        video: false,
        voteAverage: 7,
        voteCount: 2226,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Watchlist',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot<MovieModel>>(
              stream: FirestoreUtils.getRealTimeDataFromFirestore(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.error.toString()),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var moviesList = snapshot.data?.docs
                        .map((element) => element.data())
                        .toList() ??
                    [];
                return (moviesList.isEmpty)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset('assets/images/search_body.png'),
                          const SizedBox(height: 20),
                          const Text(
                            "No Movies Found",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff514F4F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HomeDetailsView.routeName,
                                  arguments: moviesList[index]);
                            },
                            child: MovieItem(model: moviesList[index])),
                        itemCount: moviesList.length,
                        padding: EdgeInsets.zero,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
