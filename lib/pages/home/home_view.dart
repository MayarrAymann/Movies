import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_view_model.dart';
import 'package:movies/pages/home/widgets/new_releases_view_widget.dart';
import 'package:movies/pages/home/widgets/popular_view_widget.dart';
import 'package:movies/pages/home/widgets/recommended_view_widget.dart';
import 'package:provider/provider.dart';

import '../../models/movie_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var vm = HomeViewModel();
  late final MovieModel model;

  @override
  void initState() {
    vm.getPopularMovieItem();
    vm.getNewReleasesMovieItem();
    vm.getRecommendMovieItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              PopularViewWidget(vm: vm),
              NewReleasesViewWidget(vm: vm),
              RecommendedViewWidget(vm: vm),
            ],
          ),
        );
      },
    );
  }
}

