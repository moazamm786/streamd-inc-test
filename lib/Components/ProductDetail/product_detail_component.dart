import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Components/ProductDetail/product_actions_listing.dart';
import 'package:streamedinc/Components/ProductDetail/product_price_and_other_sub_details.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';

import 'categories_listing.dart';

class ProductDetailComponent extends StatelessWidget {
  const ProductDetailComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, provider, child) {
        var mediaList = provider.mediaList;
        return Stack(
          children: [
            PageView.builder(
              controller: provider.controller,
              itemCount: mediaList.length,
              itemBuilder: (context, index) =>
                  LocalImage(image: mediaList[index]),
            ),
            const CategoriesListing(),
            Positioned(
              right: 24.w,
              bottom: 56.h,
              child: const ProductActionsListing(),
            ),
            Positioned(
              left: 24.w,
              bottom: 24.h,
              child: const ProductPriceAndOtherSubDetails(),
            ),
          ],
        );
      },
    );
  }
}
