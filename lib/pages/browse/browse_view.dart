import 'package:flutter/material.dart';
import 'package:movies/pages/browse/widgets/category_item.dart';

import '../../models/category_model.dart';

class BrowseView extends StatelessWidget {
  BrowseView({super.key});

  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: 'Action'),
    CategoryModel(id: 2, name: 'Romantic'),
    CategoryModel(id: 3, name: 'Comedy'),
    CategoryModel(id: 4, name: 'Scientific'),
    CategoryModel(id: 5, name: 'Adult'),
    CategoryModel(id: 1, name: 'Action'),
    CategoryModel(id: 2, name: 'Romantic'),
    CategoryModel(id: 3, name: 'Comedy'),
    CategoryModel(id: 4, name: 'Scientific'),
    CategoryModel(id: 5, name: 'Adult'),
  ];

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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 7 / 4,
                mainAxisSpacing: 35,
                crossAxisSpacing: 35,
              ),
              itemBuilder: (context, index) =>
                  CategoryItem(model: categories[index]),
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
