import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/AppNavigation/app_navigation.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';

import '../../Utils/colors_constants.dart';
import '../Widgets/local_image.dart';

class ChattingHeader extends StatelessWidget {
  const ChattingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: statusBarHeight + 80.h,
      width: double.infinity,
      color: ColorsConstants.secondary,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12.h),
      child: Consumer<ProductDetailProvider>(
        builder: (context, provider, child) {
          return Row(
            children: [
              _IconButton(
                onPressed: AppNavigation().pop,
                icon: Icons.close,
              ),
              SizedBox(width: 20.w),
              LocalImage(
                image: provider.ownerProfileImage,
                width: 60.w,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      provider.ownerName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: ColorsConstants.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Text(
                      'Posted this item for sale',
                      style: TextStyle(color: ColorsConstants.grey),
                    ),
                  ],
                ),
              ),
              _IconButton(
                onPressed: () {},
                icon: Icons.more_vert,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 25.w,
        color: ColorsConstants.white,
      ),
    );
  }
}
