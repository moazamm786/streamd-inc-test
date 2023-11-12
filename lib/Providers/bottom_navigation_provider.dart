import 'package:flutter/material.dart';
import 'package:streamedinc/Utils/images_constants.dart';

class BottomNavigationProvider extends ChangeNotifier {
  List<GlobalKey<NavigatorState>> navigatorStates =
      List.generate(5, (index) => GlobalKey<NavigatorState>());
  int selectedTab = 0;

  changeSelectedTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  var bottomItemsTitles = [
    'Home',
    'Discover',
    '',
    'Deals',
    'Profile',
  ];

  var bottomItemsSelectedIcons = [
    // Change respective selected icons from figma
    // I didn't change as they are not provided in figma and i don't have account for iconly
    ImagesConstants.homeSelected,
    ImagesConstants.search,
    ImagesConstants.homeSelected,
    ImagesConstants.deals,
    ImagesConstants.profile,
  ];

  var bottomItemsUnselectedIcons = [
    ImagesConstants.homeUnselected,
    ImagesConstants.search,
    ImagesConstants.homeUnselected,
    ImagesConstants.deals,
    ImagesConstants.profile,
  ];

  NavigatorState get selectedTabState =>
      navigatorStates[selectedTab].currentState!;
}
