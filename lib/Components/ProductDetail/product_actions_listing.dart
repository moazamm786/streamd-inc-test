import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/AppNavigation/app_navigation.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Router/app_router.dart';
import 'package:streamedinc/Utils/images_constants.dart';
import '../../Utils/colors_constants.dart';
import '../../Utils/helper_functions.dart';
import '../Widgets/Buttons/custom_button.dart';

class ProductActionsListing extends StatelessWidget {
  const ProductActionsListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, provider, child) {
        // i useded random icons as in figma icons were grouped, so i was not able to extract
        return Column(
          children: [
            _Item(
              text: 'Offer',
              onTap: () {},
              // i couldn't find offer icon as it was grouped, that's why i used random image
              // that's why yellow dots are also missing, as they can be grouped with image as part of this
              icon: ImagesConstants.offer,
            ),
            _Item(
              icon: ImagesConstants.like,
              text:
                  HelperFunctions().compactNumber(number: provider.likesCount),
              onTap: () {},
            ),
            _Item(
              icon: ImagesConstants.comment,
              text: HelperFunctions()
                  .compactNumber(number: provider.commentsCount),
              onTap: () {},
            ),
            _Item(
              icon: ImagesConstants.share,
              text:
                  HelperFunctions().compactNumber(number: provider.shareCount),
              onTap: () {},
            ),
            _Item(
              keepBottomMargin: false,
              child: LocalImage(image: provider.ownerProfileImage),
              onTap: () => AppNavigation().navigateTo(RoutesConstants.chatting),
            ),
          ],
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final String? icon;
  final String? text;
  final bool keepBottomMargin;
  final Widget? child;
  final VoidCallback? onTap;

  const _Item({
    super.key,
    this.text,
    this.icon,
    this.keepBottomMargin = true,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double size = 48.w;
    return Padding(
      padding:
          keepBottomMargin ? EdgeInsets.only(bottom: 16.h) : EdgeInsets.zero,
      child: Column(
        children: [
          CustomButton(
            height: size,
            width: size,
            onPressed: onTap,
            isCircular: true,
            child: Center(
              child: child ??
                  ImageIcon(
                    AssetImage(icon!),
                    color: ColorsConstants.white,
                  ),
            ),
          ),
          SizedBox(height: 6.h),
          if (text != null)
            Text(
              text!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
        ],
      ),
    );
  }
}
