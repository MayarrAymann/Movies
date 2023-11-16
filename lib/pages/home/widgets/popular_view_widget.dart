import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_detials/home_details_view.dart';
import '../home_view_model.dart';
import 'popular_movie_item.dart';

class PopularViewWidget extends StatelessWidget {
  HomeViewModel vm;

  PopularViewWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return (vm.popularMovies.isEmpty)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 90.0),
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                : CarouselSlider.builder(
                    itemBuilder: (context, index, r) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, HomeDetailsView.routeName,
                            arguments: vm.popularMovies[index]);
                      },
                      child: PopularMovieItem(
                        model: vm.popularMovies[index],
                      ),
                    ),
                    itemCount: vm.popularMovies.length,
                    options: CarouselOptions(
                      autoPlayInterval: const Duration(seconds: 10),
                      viewportFraction: 1,
                      height: 330,
                      autoPlay: true,
                    ),
                  );
          },
        );
      },
    );
  }
}
