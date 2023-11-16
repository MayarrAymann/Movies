import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/network_layer/firebase_utils.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/models/watchlist_model.dart';
import 'package:movies/pages/watchlist/widgets/watchlist_item.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
          Expanded(
            child: StreamBuilder<QuerySnapshot<MovieModel>>(
              stream: FirestoreUtils.getRealTimeDataFromFirestore(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.error.toString()),
                      /*
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => FirestoreUtils.(),
                    child: const Text('Retry'),
                  ),*/
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var MoviesList = snapshot.data?.docs
                        .map((element) => element.data())
                        .toList() ??
                    [];
                return (MoviesList.isEmpty)
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              'WatchList View',
                              style: TextStyle(
                                  color: Color(0xffB5B4B4),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => WatchlistItem(
                          watchlistModel: WatchlistModel(
                            title: MoviesList[index].title!,
                            year: MoviesList[index].releaseDate!,
                            actors: MoviesList[index].originalTitle!,
                            imagePath: MoviesList[index].posterPath!,
                          ),
                        ),
                        itemCount: MoviesList.length,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
