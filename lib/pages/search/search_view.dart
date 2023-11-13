import 'package:flutter/material.dart';
import 'package:movies/core/network_layer/api_manager.dart';
import 'package:movies/pages/search/widgets/custom_search_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    ApiManager.search(query: 'Mission');
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchWidget(),
            const SizedBox(
              height: 200,
            ),
            Image.asset('assets/images/search_body.png'),
            const Text(
              "No Movies Found",
              style: TextStyle(fontSize: 15, color: Color(0xff514F4F)),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
