import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Components/Widgets/Buttons/custom_button.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Utils/colors_constants.dart';
import '../../Providers/bottom_navigation_provider.dart';
import '../../Router/home_router.dart';

class CustomBottomNavigationScreen extends StatefulWidget {
  const CustomBottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationScreen> createState() =>
      _CustomBottomNavigationScreenState();
}

class _CustomBottomNavigationScreenState
    extends State<CustomBottomNavigationScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Consumer<BottomNavigationProvider>(
            builder: (context, provider, child) {
              return TabBarView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // HomeRouter is for persistent bottom navigation
                  HomeRouter(navigatorState: provider.navigatorStates[0]),
                  const Text('Discover'),
                  const Text('Add'),
                  const Text('Deals'),
                  const Text('Profile'),
                ],
              );
            },
          ),
          bottomNavigationBar: Container(
            height: 82.h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 8.w).copyWith(top: 12.h),
            decoration: BoxDecoration(
              color: ColorsConstants.secondary,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, -4),
                    color: Colors.white.withOpacity(0.15),
                    blurRadius: 24.r),
              ],
            ),
            child: Consumer<BottomNavigationProvider>(
              builder: (context, provider, child) {
                var titlesList = provider.bottomItemsTitles;
                var selectedIconsList = provider.bottomItemsSelectedIcons;
                var unselectedIconsList = provider.bottomItemsUnselectedIcons;
                return TabBar(
                  controller: controller,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  indicatorColor: Colors.transparent,
                  onTap: provider.changeSelectedTab,
                  tabs: List.generate(
                    titlesList.length,
                    (index) => _Item(
                      title: titlesList[index],
                      selectedIcon: selectedIconsList[index],
                      unselectedIcon: unselectedIconsList[index],
                      isSelected: index == provider.selectedTab,
                      isAddMenu: index == 2,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title, selectedIcon, unselectedIcon;
  final bool isSelected;
  final bool isAddMenu;

  const _Item({
    super.key,
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
    this.isSelected = false,
    this.isAddMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return isAddMenu
        ? CustomButton(
            width: 60.w,
            child: const Icon(Icons.add, color: ColorsConstants.black),
            onPressed: () {},
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LocalImage(
                image: isSelected ? selectedIcon : unselectedIcon,
                width: 28.w,
              ),
              SizedBox(height: 6.h),
              Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? const Color.fromRGBO(60, 254, 222, 1)
                      : const Color.fromRGBO(160, 172, 189, 1),
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          );
  }
}
