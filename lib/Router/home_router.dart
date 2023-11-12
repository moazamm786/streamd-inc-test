import 'package:flutter/material.dart';
import 'package:streamedinc/Screens/ChatingScreen/chatting_screen.dart';
import 'package:streamedinc/Screens/ProductDetailScreen/product_detail_screen.dart';
import '../Screens/RouteNotFoundScreen/route_not_found_screen.dart';
import 'app_router.dart';

class HomeRouter extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorState;

  const HomeRouter({Key? key, required this.navigatorState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorState,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesConstants.initial:
            return MaterialPageRoute(
                builder: (context) => const ProductDetailScreen());

          default:
            return MaterialPageRoute(
              builder: (context) =>
                  RouteNotFoundScreen(routeName: settings.name!),
              settings: RouteSettings(name: settings.name),
            );
        }
      },
    );
  }
}
