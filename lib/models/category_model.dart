class CategoryModel {
  final int id;
  final String name;
  String? imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    this.imagePath,
  });
}
