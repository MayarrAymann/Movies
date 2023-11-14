import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/application_theme.dart';
import 'package:movies/layout/home_layout.dart';
import 'package:movies/pages/browse/widgets/genre_view.dart';
import 'package:movies/pages/splash/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ApplicationTheme.theme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        GenreView.routeName: (context) => GenreView(),
      },
    );
  }
}
