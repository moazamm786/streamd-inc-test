import 'package:flutter/material.dart';

import '../Models/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  late CategoriesResponse _response;

  setResponse(CategoriesResponse response) {
    _response = response;
  }

  List<CategoryData> get categoriesList => _response.categoryData ?? [];
}
