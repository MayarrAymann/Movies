import 'package:flutter/material.dart';
import 'package:movies/pages/home/widgets/recommend_movie_item.dart';
import 'package:provider/provider.dart';

import '../home_view_model.dart';

class RecommendedViewWidget extends StatefulWidget {
  const RecommendedViewWidget({super.key});

  @override
  State<RecommendedViewWidget> createState() => _RecommendedViewWidgetState();
}

class _RecommendedViewWidgetState extends State<RecommendedViewWidget> {
  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    vm.getRecommendMovieItem();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return (vm.recommendMovies.isEmpty)
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
                                "Recommended",
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
                                    RecommendMovieItem(
                                  model: vm.recommendMovies[index],
                                ),
                                itemCount: vm.recommendMovies.length,
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
