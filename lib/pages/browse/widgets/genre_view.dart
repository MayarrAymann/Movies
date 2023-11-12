import 'package:flutter/material.dart';
import 'package:movies/pages/browse/browse_view_model.dart';
import 'package:movies/pages/browse/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class GenreView extends StatefulWidget {
  static const String routeName = 'genre-view';

  const GenreView({super.key});

  @override
  State<GenreView> createState() => _GenreViewState();
}

class _GenreViewState extends State<GenreView> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as BrowseViewModel;
    return ChangeNotifierProvider(
      create: (context) => args,
      builder: (context, child) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Genre',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
              Consumer<BrowseViewModel>(
                builder: (context, args, child) => Expanded(
                  child: (args.movies.isEmpty)
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
                              MovieItem(model: args.movies[index]),
                          itemCount: args.movies.length,
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
