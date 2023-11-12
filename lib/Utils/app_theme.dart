import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_constants.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Urbanist',
        color: ColorsConstants.white,
      ),
    ),
  );
}
