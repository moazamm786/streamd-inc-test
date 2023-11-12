import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Providers/bottom_navigation_provider.dart';

class AppNavigation {
  static final navigationKey = GlobalKey<NavigatorState>();

  navigateTo(String route,
      {bool useTabContext = false, Object? args, VoidCallback? onBack}) {
    // tabContext will be used for persistent bottom navigation
    if (useTabContext) {
      NavigatorState selectedTabState =
          context.read<BottomNavigationProvider>().selectedTabState;
      selectedTabState.pushNamed(route, arguments: args).then((value) {
        if (onBack != null) {
          onBack();
        }
      });
    } else {
      navigationKey.currentState!
          .pushNamed(route, arguments: args)
          .then((value) {
        if (onBack != null) {
          onBack();
        }
      });
    }
  }

  pop({bool useTabContext = false}) {
    // tabContext will be used for persistent bottom navigation
    if (useTabContext) {
      NavigatorState selectedTabState =
          context.read<BottomNavigationProvider>().selectedTabState;
      selectedTabState.pop();
    } else {
      navigationKey.currentState!.pop();
    }
  }

  BuildContext get context => navigationKey.currentState!.overlay!.context;
}
