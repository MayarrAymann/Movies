import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/theme/application_theme.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'pages/browse/widgets/genre_view.dart';
import 'pages/home/home_detials/home_details_view.dart';
import 'pages/splash/splash_view.dart';

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
        HomeDetailsView.routeName: (context) => HomeDetailsView(),
      },
    );
  }
}
