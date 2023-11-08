import 'package:flutter/material.dart';
import 'package:movies/models/watchlist_model.dart';
import 'package:movies/pages/watchlist/widgets/watchlist_item.dart';

class WatchListView extends StatelessWidget {
  WatchListView({super.key});

  List<WatchlistItem> items = [
    WatchlistItem(
      watchlistModel: WatchlistModel(
          title: 'Alita Battle Angel',
          year: '2019',
          actors: 'Rosa Salazar, Christoph Waltz',
          imagePath: 'assets/images/MovieCover.png'),
    ),
    WatchlistItem(
      watchlistModel: WatchlistModel(
          title: 'Alita Battle Angel',
          year: '2019',
          actors: 'Rosa Salazar, Christoph Waltz',
          imagePath: 'assets/images/MovieCover.png'),
    ),
    WatchlistItem(
      watchlistModel: WatchlistModel(
          title: 'Alita Battle Angel',
          year: '2019',
          actors: 'Rosa Salazar, Christoph Waltz',
          imagePath: 'assets/images/MovieCover.png'),
    ),
    WatchlistItem(
      watchlistModel: WatchlistModel(
          title: 'Alita Battle Angel',
          year: '2019',
          actors: 'Rosa Salazar, Christoph Waltz',
          imagePath: 'assets/images/MovieCover.png'),
    ),
    WatchlistItem(
      watchlistModel: WatchlistModel(
          title: 'Alita Battle Angel',
          year: '2019',
          actors: 'Rosa Salazar, Christoph Waltz',
          imagePath: 'assets/images/MovieCover.png'),
    ),
  ];

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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => items[index],
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
