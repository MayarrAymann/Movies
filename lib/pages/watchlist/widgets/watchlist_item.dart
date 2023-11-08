import 'package:flutter/material.dart';

import '../../../models/watchlist_model.dart';

class WatchlistItem extends StatelessWidget {
  final WatchlistModel watchlistModel;

  const WatchlistItem({
    super.key,
    required this.watchlistModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 90,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 140,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(watchlistModel.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset('assets/images/bookmarked.png'),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      watchlistModel.title,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      watchlistModel.year,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white60,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      watchlistModel.actors,
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
