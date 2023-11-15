import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_view_model.dart';
import 'package:movies/pages/home/widgets/new_releases_movie_item.dart';
import 'package:movies/pages/home/widgets/popular_movie_item.dart';
import 'package:movies/pages/home/widgets/recommend_movie_item.dart';
import 'package:provider/provider.dart';

import '../../models/movie_model.dart';
import 'home_detials/home_details_view.dart';

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
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ChangeNotifierProvider(
            create: (context) => vm,
            builder: (context, child) {
              return Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return (vm.movies.isEmpty)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 90.0),
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      : CarouselSlider.builder(
                          itemBuilder: (context, index, r) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HomeDetailsView.routeName,
                                  arguments: model);
                            },
                            child: PopularMovieItem(
                              model: vm.movies[index],
                            ),
                          ),
                          itemCount: vm.movies.length,
                          options: CarouselOptions(
                            autoPlayInterval: const Duration(seconds: 3),
                            viewportFraction: 1,
                            height: 330,
                            autoPlay: true,
                          ),
                        );
                },
              );
            },
          ),
          ChangeNotifierProvider(
            create: (context) => vm,
            builder: (context, child) {
              return Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return (vm.movies.isEmpty)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 90.0),
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 250,
                              color: const Color(0XFF282A28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "New Releases",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              HomeDetailsView.routeName,
                                              arguments: model);
                                        },
                                        child: NewReleasesMovieItem(
                                          model: vm.movies[index],
                                        ),
                                      ),
                                      itemCount: vm.movies.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                },
              );
            },
          ),
          ChangeNotifierProvider(
            create: (context) => vm,
            builder: (context, child) {
              return Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return (vm.movies.isEmpty)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 90.0),
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 350,
                              color: const Color(0XFF282A28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "Recommended",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          RecommendMovieItem(
                                          model: vm.movies[index],
                                        ),
                                      itemCount: vm.movies.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
