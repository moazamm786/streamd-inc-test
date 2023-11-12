import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/AppNavigation/app_navigation.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Utils/images_constants.dart';

import '../Models/product_detail_response.dart';

class ProductService {
  Future<ProductDetailResponse> getProductDetail() async {
    // faking API response
    await Future.delayed(const Duration(seconds: 1));
    ProductDetailResponse response = ProductDetailResponse(
      data: ProductData(
          title: 'MacBook Air 2013',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit... #Lorem #ipsum #amet',
          currency: 'AED',
          price: 1200,
          location: 'Dubai, United Arab Emirates',
          likesCount: 4500,
          commentsCount: 12400,
          shareCount: 77,
          countryFlag: ImagesConstants.flag,
          media: [
            ImagesConstants.macbook,
            ImagesConstants.macbook,
            ImagesConstants.macbook,
            ImagesConstants.macbook,
            ImagesConstants.macbook,
          ],
          productOwner: ProductOwner(
            name: 'Abu Hamza',
            profileImage: ImagesConstants.user,
          )),
    );
    BuildContext context = AppNavigation().context;
    context.read<ProductDetailProvider>().setResponse(response);
    return response;
  }
}
