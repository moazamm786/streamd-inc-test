import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamedinc/Components/Widgets/Buttons/custom_button.dart';
import 'package:streamedinc/Components/Widgets/FormField/custom_text_form_field.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Utils/colors_constants.dart';
import 'package:streamedinc/Utils/images_constants.dart';

class FormFieldWithActions extends StatefulWidget {
  const FormFieldWithActions({Key? key}) : super(key: key);

  @override
  State<FormFieldWithActions> createState() => _FormFieldWithActionsState();
}

class _FormFieldWithActionsState extends State<FormFieldWithActions> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 56.w;
    return Container(
      height: 96.h,
      decoration:  BoxDecoration(
        color: ColorsConstants.secondary,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -4),
              color: Colors.white.withOpacity(0.15),
              blurRadius: 24.r),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 20.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: controller,
              hint: 'Type message...',
              contentPadding: EdgeInsets.symmetric(vertical: 20.h).copyWith(
                left: 24.w,
                right: 86.w,
              ),
              fillColor: ColorsConstants.primary,
              suffixIcon: Row(
                children: [
                  _ActionItem(
                    image: ImagesConstants.camera,
                    onTap: () {},
                  ),
                  SizedBox(width: 14.w),
                  _ActionItem(
                    image: ImagesConstants.location,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          CustomButton(
            width: buttonSize,
            height: buttonSize,
            isCircular: true,
            backgroundColor: ColorsConstants.aqua,
            onPressed: () {},
            child: LocalImage(
              image: ImagesConstants.send,
              width: 26.w,
            ),
          )
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _ActionItem({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(image),
        color: ColorsConstants.hintText,
        size: 20.w,
      ),
    );
  }
}
