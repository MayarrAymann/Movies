import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            'Search View',
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
