import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Components/Widgets/Buttons/custom_button.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Utils/colors_constants.dart';
import 'package:streamedinc/Utils/helper_functions.dart';
import 'package:streamedinc/Utils/images_constants.dart';

import 'media_dot_indicator.dart';

class ProductPriceAndOtherSubDetails extends StatelessWidget {
  const ProductPriceAndOtherSubDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: 320.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                provider.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: ColorsConstants.amber,
                  ),
                  children: [
                    TextSpan(text: '${provider.currency} '),
                    TextSpan(text: HelperFunctions().formatPrice(price: provider.price)),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                provider.description,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: ColorsConstants.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  LocalImage(
                    image: provider.countryFlag,
                    width: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      provider.location,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomButton(
                width: 150.w,
                onPressed: () {},
                child: const Text(
                  'Visit Website',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 22.h),
              const MediaDotIndicator(),
            ],
          ),
        );
      },
    );
  }
}
