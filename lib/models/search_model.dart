import 'movie_model.dart';

class SearchModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      page: json['page'],
      results:
          (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
