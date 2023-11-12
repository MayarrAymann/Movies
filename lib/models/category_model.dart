import 'genre_model.dart';

class CategoryModel {
  final List<GenreModel> genres;

  CategoryModel({
    required this.genres,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        genres: (json['genres'] as List)
            .map((e) => GenreModel.fromJson(e))
            .toList());
  }
}


