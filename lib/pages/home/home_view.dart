import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movie_model.dart';
import 'home_view_model.dart';
import 'widgets/popular_view_widget.dart';
import 'widgets/new_releases_view_widget.dart';
import 'widgets/recommended_view_widget.dart';

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
    super.initState();
    vm.getPopularMovies();
    vm.getNewReleasesMovies();
    vm.getRecommendMovies();
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

