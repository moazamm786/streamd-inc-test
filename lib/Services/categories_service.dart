import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/AppNavigation/app_navigation.dart';
import 'package:streamedinc/Providers/categories_provider.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Utils/images_constants.dart';

import '../Models/categories_response.dart';
import '../Models/product_detail_response.dart';

class CategoriesService {
  Future<CategoriesResponse> getCategories() async {
    // faking API response
    await Future.delayed(const Duration(seconds: 1));
    CategoriesResponse response = CategoriesResponse(
      categoryData: [
        CategoryData(
          title: 'Electronics',
          media: ImagesConstants.electronics,
        ),
        CategoryData(
          title: 'Appliances',
          media: ImagesConstants.appliances,
        ),
        CategoryData(
          title: 'Mobiles',
          media: ImagesConstants.mobiles,
        )
      ],
    );
    BuildContext context = AppNavigation().context;
    context.read<CategoriesProvider>().setResponse(response);
    return response;
  }
}
