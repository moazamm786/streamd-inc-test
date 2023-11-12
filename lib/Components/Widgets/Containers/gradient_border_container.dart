import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../Buttons/custom_button.dart';

class GradientBorderContainer extends StatelessWidget {
  final double? width, height;
  final double? borderWidth;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final DecorationImage? image;

  const GradientBorderContainer({
    Key? key,
    this.width,
    this.height,
    this.borderWidth,
    this.child,
    this.backgroundColor,
    this.padding,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: GradientBoxBorder(
          gradient: primaryLinearGradient(),
          width: borderWidth ?? 2,
        ),
        image: image,
      ),
      child: child,
    );
  }
}
