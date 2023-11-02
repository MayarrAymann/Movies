import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
