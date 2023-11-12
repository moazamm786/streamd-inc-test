import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamedinc/Utils/colors_constants.dart';
import 'package:streamedinc/Utils/helper_functions.dart';

import '../../../Models/messages_response.dart';

class TextMessageCardUI extends StatelessWidget {
  final MessageData data;

  const TextMessageCardUI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool ownMessage = data.ownMessage!;
    Radius radius = Radius.circular(20.r);
    String time = HelperFunctions().formatDate(date: data.createdAt!);
    return Align(
      alignment: ownMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        alignment: ownMessage ? Alignment.centerRight : Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        constraints: BoxConstraints(maxWidth: size.width * 0.7),
        decoration: BoxDecoration(
          color: ownMessage ? ColorsConstants.secondary : ColorsConstants.white,
          borderRadius: BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
            topRight: radius,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                data.message!,
                style: TextStyle(
                  color: ownMessage
                      ? ColorsConstants.white
                      : ColorsConstants.primary,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              time,
              style: TextStyle(
                color: ownMessage
                    ? ColorsConstants.white
                    : const Color.fromRGBO(113, 131, 157, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
