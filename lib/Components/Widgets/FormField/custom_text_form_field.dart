import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/colors_constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? height;
  final TextStyle? textStyle;
  final Color? fillColor;

  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.height,
    this.fillColor,
    this.textStyle,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: ColorsConstants.white,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: textInputAction,
            style: const TextStyle(color: ColorsConstants.white),
            decoration: InputDecoration(
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              hintText: hint,
              hintStyle: const TextStyle(color: ColorsConstants.hintText),
              border: border,
              filled: fillColor != null,
              fillColor: fillColor,
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
        if (suffixIcon != null)
          Positioned(
            right: 16.w,
            top: 16.w,
            child: suffixIcon!,
          )
      ],
    );
  }
}

InputBorder get border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    );
