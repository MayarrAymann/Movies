import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_view_model.dart';
import 'package:movies/pages/home/widgets/popular_movie_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var vm = HomeViewModel();

  @override
  void initState() {
    vm.getPopularMovieItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
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
                          onTap: () {},
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
      ],
    );
  }
}
