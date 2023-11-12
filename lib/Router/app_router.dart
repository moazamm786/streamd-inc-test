import 'package:flutter/material.dart';
import 'package:streamedinc/Screens/BottomBar/custom_bottom_bar.dart';

import '../Screens/ChatingScreen/chatting_screen.dart';
import '../Screens/RouteNotFoundScreen/route_not_found_screen.dart';

class AppRouter {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RoutesConstants.initial:
        return MaterialPageRoute(
          builder: (context) => const CustomBottomNavigationScreen(),
          settings: RouteSettings(name: settings.name),
        );

      case RoutesConstants.chatting:
        return MaterialPageRoute(
            builder: (context) => const ChattingScreen());


      default:
        return MaterialPageRoute(
          builder: (context) => RouteNotFoundScreen(routeName: settings.name!),
          settings: RouteSettings(name: settings.name),
        );
    }
  }
}

class RoutesConstants {
  static const String initial = '/';
  static const String chatting = '/chat';
}
