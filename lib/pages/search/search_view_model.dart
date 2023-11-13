import 'package:flutter/foundation.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  changeSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
