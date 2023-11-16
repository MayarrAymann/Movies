import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_detials/similarMoviesItems.dart';
import 'package:provider/provider.dart';

import '../../../models/movie_model.dart';
import '../home_view_model.dart';

class SimilarMoviesView extends StatefulWidget{
  @override
  State<SimilarMoviesView> createState() => _SimilarMoviesViewState();
}

class _SimilarMoviesViewState extends State<SimilarMoviesView> {
  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    vm.gatSimilarMoviesItem();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var args = ModalRoute.of(context)?.settings.arguments as MovieModel;
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return (vm.similarMovies.isEmpty)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 90.0),
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
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "More like this",
                          style: theme.textTheme.bodyLarge!.copyWith(
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
                              SimilarlMoviesItem(
                                detailsModel: vm.similarMovies[index],
                              ),
                          itemCount: vm.similarMovies.length,
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
    );
  }
}