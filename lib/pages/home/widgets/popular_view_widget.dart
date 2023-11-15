import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_view_model.dart';
import 'package:movies/pages/home/widgets/popular_movie_item.dart';
import 'package:provider/provider.dart';
import '../home_detials/home_details_view.dart';

class PopularViewWidget extends StatefulWidget {
  const PopularViewWidget({super.key});

  @override
  State<PopularViewWidget> createState() => _PopularViewWidgetState();
}

class _PopularViewWidgetState extends State<PopularViewWidget> {
  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    vm.getPopularMovieItem();
  }

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
                        Navigator.pushNamed(
                          context,
                          HomeDetailsView.routeName,
                        );
                      },
                      child: PopularMovieItem(
                        model: vm.popularMovies[index],
                      ),
                    ),
                    itemCount: vm.popularMovies.length,
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
    );
  }
}
