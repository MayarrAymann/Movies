import 'package:flutter/material.dart';
import 'package:movies/core/network_layer/api_manager.dart';
import 'package:movies/pages/browse/widgets/category_item.dart';

import '../../models/category_model.dart';

class BrowseView extends StatefulWidget {
  BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          FutureBuilder(
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
          ),
        ],
      ),
    );
  }
}
