import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Components/Widgets/Buttons/custom_button.dart';
import 'package:streamedinc/Components/Widgets/local_image.dart';
import 'package:streamedinc/Providers/categories_provider.dart';
import 'package:streamedinc/Utils/images_constants.dart';

import '../../Utils/colors_constants.dart';
import 'gradient_border_container_with_title.dart';

class CategoriesListing extends StatelessWidget {
  const CategoriesListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, provider, child) {
        var categories = provider.categoriesList;
        return Container(
          height: 124.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.8),
                Color.fromRGBO(0, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: categories.length + 3,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _ActionItem(
                  iconSize: 40.h,
                  title: 'Add Listing',
                  icon: ImagesConstants.add,
                  onTap: () {},
                );
              } else if (index == 1) {
                return _ActionItem(
                  title: 'Search',
                  icon: ImagesConstants.search,
                  onTap: () {},
                );
              } else if (index == 2) {
                return _ActionItem(
                  title: 'Notification',
                  icon: ImagesConstants.notification,
                  isNotification: true,
                  onTap: () {},
                );
              } else {
                index -= 3;
                var category = categories[index];
                return GradientBorderContainerWithTitle(
                  title: category.title!,
                  // ClipOval will keep image inside the circle
                  child: ClipOval(child: LocalImage(image: category.media!)),
                );
              }
            },
            separatorBuilder: (context, index) => SizedBox(width: 18.w),
          ),
        );
      },
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String title;
  final String icon;
  final double? iconSize;

  final VoidCallback onTap;
  final bool isNotification;

  const _ActionItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconSize,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    double size = 9.w;
    return InkWell(
      onTap: onTap,
      child: GradientBorderContainerWithTitle(
        title: title,
        child: Center(
          child: Stack(
            children: [
              ImageIcon(
                AssetImage(icon),
                color: ColorsConstants.white,
                size: iconSize ?? 24.h,
              ),
              if (isNotification)
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: secondaryLinearGradient,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
