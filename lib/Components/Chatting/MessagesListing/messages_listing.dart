import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Components/Chatting/MessagesListing/counter_offer_card.dart';
import 'package:streamedinc/Components/Chatting/MessagesListing/message_card_u_i.dart';
import 'package:streamedinc/Providers/chatting_provider.dart';

import '../../../Utils/colors_constants.dart';

class MessagesListing extends StatelessWidget {
  const MessagesListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChattingProvider>(
      builder: (context, provider, child) {
        var groupedMessagesListMap = provider.messagesListMap;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: groupedMessagesListMap.length,
          itemBuilder: (BuildContext context, int index) {
            var date = groupedMessagesListMap.keys.elementAt(index);
            var messagesList = groupedMessagesListMap.values.elementAt(index);
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color.fromRGBO(42, 43, 57, 1),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorsConstants.grey,
                    ),
                  ),
                ),
                ListView.separated(
                  itemCount: messagesList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemBuilder: (BuildContext context, int index) {
                    var message = messagesList[index];
                    bool isCounterOffer = message.type == 'counterOffer';
                    return isCounterOffer
                        ? CounterOfferCard(data: message.counterOffer!)
                        : TextMessageCardUI(data: message);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 24.h),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
