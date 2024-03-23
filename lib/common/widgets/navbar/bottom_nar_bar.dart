import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/helpers/shadow_disabler.dart';
import '/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';

class BottomRoundedNavBar extends StatelessWidget {
  final List<BottomNavBarWidget> items;
  final int currentIndex;
  final Function(int index) onChanged;
  final double height;
  const BottomRoundedNavBar(
      {super.key,
      required this.items,
      required this.currentIndex,
      required this.onChanged,
      this.height = 80});

  // Color _buildIconColor(int index, BuildContext context) {
  //   if (index == currentIndex) {
  //     return Colors.white;
  //   }

  //   return const Color(0xFFB3B3B7);
  // }

  Color _buildIconContainerColor(int index, BuildContext context) {
    if (index == currentIndex) {
      return items[index].selectedIconColor;
    }
    return Theme.of(context).iconTheme.color!;
  }

  // Color _buildTextColor(int index, BuildContext context) {
  //   if (index == currentIndex) {
  //     return Colors.white;
  //   }

  //   return const Color(0xFFB3B3B7);
  // }

  // Widget _buildBottomNavbarWidget(int index, BuildContext context) {
  //   return I(
  //     items[index].icon,
  //     color: _buildIconContainerColor(index, context),
  //     size: items[index].iconSize,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KSizes.sm),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KSizes.borderRadiusXxl),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: height,
            padding: const EdgeInsets.only(left: KSizes.sm, right: KSizes.sm),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //code for shadow in upper direction
              // color: kBoxLight.withOpacity(0.5),
              boxShadow: CustomShadow.getShadow([
                BoxShadow(
                  color: kBoxLight.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(10, 10), // changes position of shadow
                ),
              ]),              borderRadius: BorderRadius.circular(KSizes.borderRadiusXxl),
              border: Border.all(
                color: kBoxLight,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < items.length; i++)
                  GestureDetector(
                    onTap: () {
                      onChanged(i);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      width: 80,
                      padding: const EdgeInsets.symmetric(horizontal: KSizes.sm, vertical: KSizes.sm),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linearToEaseOut,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // _buildBottomNavbarWidget(i, context),
                          SvgPicture.asset(
                            items[i].icon,
                            color: _buildIconContainerColor(i, context),
                            height: KSizes.iconMd,
                          ),
                          const SizedBox(
                            height: KSizes.xs
                          ),
                          Text(
                            items[i].title,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: _buildIconContainerColor(i, context),
                            )
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarWidget {
  final String icon;
  final String title;
  final double iconSize;
  final Color selectedIconColor;

  const BottomNavBarWidget({
    required this.icon,
    required this.title,
    required this.iconSize,
    required this.selectedIconColor,
  });
}