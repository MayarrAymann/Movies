import 'package:flutter/material.dart';
import 'package:movies/core/theme/application_theme.dart';
import 'package:movies/layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ApplicationTheme.theme,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
      },
    );
  }
}

