import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/colors_constants.dart';
import '../Widgets/Containers/gradient_border_container.dart';

class GradientBorderContainerWithTitle extends StatelessWidget {
  final String title;
  final Widget child;

  const GradientBorderContainerWithTitle(
      {Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.h;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientBorderContainer(
          height: size,
          width: size,
          child: child,
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
