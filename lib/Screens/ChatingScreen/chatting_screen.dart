import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Providers/chatting_provider.dart';
import 'package:streamedinc/Services/chatting_service.dart';
import 'package:streamedinc/Utils/colors_constants.dart';

import '../../Components/Chatting/chatting_component.dart';
import '../../Components/Widgets/FutureProvider/custom_future_builder.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  late Future getData;

  callApi() {
    getData = ChattingService().getMessages();
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.primary,
      body: CustomFutureBuilder(
        future: getData,
        child: const ChattingComponent(),
      ),
    );
  }
}
