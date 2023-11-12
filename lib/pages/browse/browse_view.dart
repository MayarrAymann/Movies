import 'package:flutter/material.dart';
import 'package:movies/pages/browse/widgets/category_item.dart';
import 'package:movies/pages/browse/widgets/movie_item.dart';
import 'package:provider/provider.dart';

import 'browse_view_model.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  var vm = BrowseViewModel();

  @override
  void initState() {
    vm.getGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return (vm.isGenreSelected)
            ? Padding(
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
                                itemCount: args.movies.length,
                              ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Browse Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Consumer<BrowseViewModel>(
                      builder: (context, vm, child) {
                        return Expanded(
                          child: (vm.genres.isEmpty)
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Color(0xffB5B4B4),
                                    ),
                                  ],
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 7 / 4,
                                    mainAxisSpacing: 35,
                                    crossAxisSpacing: 35,
                                  ),
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                          onTap: () async {
                                            vm.selectedGenre(true);
                                            vm.getMovies(vm.genres[index].id);
                                          },
                                          child: CategoryItem(
                                              model: vm.genres[index])),
                                  itemCount: vm.genres.length,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                ),
                        );
                      },
                    ),
                    /*FutureBuilder(
              future: ApiManager.fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.error.toString()),
                      ],
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xffB5B4B4),
                        ),
                      ],
                    ),
                  );
                }
                CategoryModel categories = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 7 / 4,
                      mainAxisSpacing: 35,
                      crossAxisSpacing: 35,
                    ),
                    itemBuilder: (context, index) =>
                        CategoryItem(model: categories.genres[index]),
                    itemCount: categories.genres.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                );
              },
            ),*/
                  ],
                ),
              );
      },
    );
  }
}
