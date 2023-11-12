import 'package:flutter/material.dart';
import 'package:streamedinc/Utils/helper_functions.dart';

import '../Models/messages_response.dart';

class ChattingProvider extends ChangeNotifier {
  late MessagesResponse _response;
  Map<String, List<MessageData>> messagesListMap = {};

  setResponse(MessagesResponse response) {
    _response = response;
    groupMessagesBasedOnTimestamp();
  }

  groupMessagesBasedOnTimestamp() {
    messagesListMap = {};
    _response.data?.forEach(
      (element) {
        var messageTimestamp = DateTime.parse(element.createdAt!);
        var onlyDate = DateTime(messageTimestamp.year, messageTimestamp.month,
            messageTimestamp.day);
        var formattedDate =
            HelperFunctions().messageFormattedDate(date: onlyDate);
        if (messagesListMap.containsKey(formattedDate)) {
          messagesListMap[formattedDate]?.add(element);
        } else {
          messagesListMap[formattedDate] = [element];
        }
      },
    );
  }
}
