import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Utils/colors_constants.dart';

class CounterOfferAttachmentsListing extends StatelessWidget {
  final List<String> attachments;

  const CounterOfferAttachmentsListing({Key? key, required this.attachments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: attachments.length,
        itemBuilder: (BuildContext context, int index) {
          return _Item(image: attachments[index]);
        },
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String image;

  const _Item({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        color: ColorsConstants.white,
        child: LocalImage(image: image),
      ),
    );
  }
}
