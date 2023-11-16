import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/genre_model.dart';
import '../../../pages/browse/browse_view_model.dart';
import '../../../pages/browse/widgets/movie_item.dart';

class GenreView extends StatelessWidget {
  static const String routeName = 'genre-view';

  GenreView({super.key});

  var vm = BrowseViewModel();

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute.of(context)?.settings.arguments as GenreModel;
    vm.getMovies(genre.id);

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(genre.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<BrowseViewModel>(
                builder: (context, vm, child) => Expanded(
                  child: (vm.movies.isEmpty)
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Color(0xffB5B4B4),
                              ),
                            ],
                          )
                              : ListView.builder(
                            itemBuilder: (context, index) =>
                                MovieItem(model: vm.movies[index]),
                            itemCount: vm.movies.length,
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
