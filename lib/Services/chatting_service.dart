import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Utils/images_constants.dart';

import '../AppNavigation/app_navigation.dart';
import '../Models/messages_response.dart';
import '../Providers/chatting_provider.dart';

class ChattingService {
  Future<MessagesResponse> getMessages() async {
    // faking API response
    await Future.delayed(const Duration(seconds: 1));
    MessagesResponse response = MessagesResponse(
      data: [
        MessageData(
          createdAt: '${DateTime.now()}',
          message: 'Iam interested to buy your product with counter offer?',
          type: 'text',
          ownMessage: false,
        ),
        MessageData(
          createdAt: '${DateTime.now()}',
          type: 'counterOffer',
          ownMessage: true,
          counterOffer: CounterOffer(
              banner: ImagesConstants.macbook,
              title: 'DSLR NIKON 520D with 18mm Lense',
              location: 'Bur Dubai, United Arab Emirates',
              offered: '\$1200 + 200 Saltaries + Product',
              actions: [
                'Reject',
                'Accept'
              ],
              attachments: [
                ImagesConstants.camera1,
                ImagesConstants.camera2,
                ImagesConstants.camera1,
                ImagesConstants.camera2,
                ImagesConstants.camera1,
                ImagesConstants.camera2,
              ]),
        ),
      ],
    );
    BuildContext context = AppNavigation().context;
    context.read<ChattingProvider>().setResponse(response);
    return response;
  }
}
