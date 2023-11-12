import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Utils/colors_constants.dart';

import '../Widgets/Buttons/custom_button.dart';

class MediaDotIndicator extends StatelessWidget {
  const MediaDotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, provider, child) {
        var mediaList = provider.mediaList;
        return Row(
          children: List.generate(
            mediaList.length,
            (index) => _Item(
              isSelected: index == provider.currentMediaPage,
              keepRightMargin: index != mediaList.length,
              onTap: () => provider.changeMediaPage(index),
            ),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final bool isSelected;
  final bool keepRightMargin;
  final VoidCallback onTap;

  const _Item(
      {required this.isSelected,
      this.keepRightMargin = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSelected ? 20.w : 10.w,
        height: 10.h,
        margin:
            keepRightMargin ? EdgeInsets.only(right: 12.w) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isSelected ? null : ColorsConstants.white,
          gradient: isSelected ? secondaryLinearGradient : null,
          shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isSelected ? BorderRadius.circular(10.r) : null,
        ),
      ),
    );
  }
}
