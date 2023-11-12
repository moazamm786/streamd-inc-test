import 'package:flutter/material.dart';
import 'package:streamedinc/Components/Chatting/chatting_header.dart';
import 'package:streamedinc/Components/Chatting/form_field_with_actions.dart';

import 'MessagesListing/messages_listing.dart';


class ChattingComponent extends StatelessWidget {
  const ChattingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChattingHeader(),
        Expanded(child: MessagesListing()),
        FormFieldWithActions(),
      ],
    );
  }
}
