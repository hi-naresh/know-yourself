import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourself/utils/constants/colors.dart';
import '/utils/device/device_utility.dart';
import '../../../utils/constants/sizes.dart';

class KPageBar extends StatelessWidget implements PreferredSizeWidget {
  const KPageBar({super.key, this.title, this.onTap, this.showBackButton=true, this.action});
  final String? title;
  final bool? showBackButton;
  final Function()? onTap;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      centerTitle: true,
      leading: showBackButton! ? Padding(
        padding: const EdgeInsets.only(left: KSizes.defaultSpace),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.back,
              size: KSizes.iconSm,
              color: KColors.white,
            ),
          ),
        ),
      ): null,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: KSizes.defaultSpace),
            child: action ?? const SizedBox.shrink()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
