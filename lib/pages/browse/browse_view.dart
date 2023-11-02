import 'package:flutter/material.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            'Browse View',
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
