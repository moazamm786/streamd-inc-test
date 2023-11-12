import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamedinc/Components/Widgets/Buttons/custom_button.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Models/messages_response.dart';

import '../../../Utils/colors_constants.dart';
import 'counter_offer_attachments_listing.dart';

class CounterOfferCard extends StatelessWidget {
  final CounterOffer data;

  const CounterOfferCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius radius = Radius.circular(20.r);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorsConstants.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius,
          topRight: radius,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Counter Offer',
            style: TextStyle(
              color: ColorsConstants.aqua,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: LocalImage(
              image: data.banner!,
              height: 147.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            data.title!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h),
          CustomTextRich(title: 'Location', value: data.location!),
          SizedBox(height: 12.h),
          CustomTextRich(title: 'Offered', value: data.offered!),
          SizedBox(height: 24.h),
          CounterOfferAttachmentsListing(attachments: data.attachments!),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              data.actions!.length,
              (index) {
                bool accept = data.actions![index].toLowerCase() == 'accept';
                return CustomButton(
                  width: 160.w,
                  height: 58.h,
                  radius: 16.r,
                  backgroundColor: accept ? null : ColorsConstants.red,
                  onPressed: () {},
                  child: Text(
                    accept ? 'Accept' : 'Reject',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextRich extends StatelessWidget {
  final String title, value;

  const CustomTextRich({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    var offersItems = value.split('+');
    return Text.rich(
      TextSpan(
        style: TextStyle(
          color: ColorsConstants.white,
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
        ),
        children: [
          TextSpan(text: '$title: '),
          ...List.generate(
            offersItems.length,
            (index) {
              bool isLastItem = index == offersItems.length - 1;
              return TextSpan(
                children: [
                  TextSpan(
                    text: offersItems[index],
                    style: const TextStyle(
                      color: ColorsConstants.aqua,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (!isLastItem) const TextSpan(text: ' + '),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
