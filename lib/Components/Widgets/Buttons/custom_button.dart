import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamedinc/Utils/colors_constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? height, width, radius;
  final Color? backgroundColor;
  final bool isCircular;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.radius,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius =
        isCircular ? BorderRadius.zero : BorderRadius.circular(radius ?? 8.r);
    Widget button = Container(
      height: height ?? 40.h,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        gradient: backgroundColor == null ? primaryLinearGradient() : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsConstants.transparent,
            elevation: 0,
            minimumSize: const Size(double.infinity, double.infinity),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        onPressed: onPressed,
        child: child,
      ),
    );
    return isCircular ? ClipOval(child: button) : button;
  }
}

Gradient primaryLinearGradient({List<Color>? colors}) => LinearGradient(
      colors: colors ??
          [
            ColorsConstants.skyBlue,
            ColorsConstants.aqua,
          ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

Gradient get secondaryLinearGradient => primaryLinearGradient(
      colors: [
        const Color.fromRGBO(247, 99, 29, 1),
        const Color.fromRGBO(249, 181, 39, 1),
      ],
    );
