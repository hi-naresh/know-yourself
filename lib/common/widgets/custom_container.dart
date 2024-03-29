import 'package:flutter/material.dart';
import 'package:knowyourself/utils/constants/sizes.dart';
import 'package:knowyourself/utils/helpers/shadow_disabler.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  // final double height;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final Clip? clipBehavior;
  final EdgeInsets margin;
  final List<BoxShadow> boxShadow;
  final Alignment alignment;
  final Function()? onTap;

  const CustomContainer({super.key,
    required this.child,
    this.width = double.infinity,
    // this.height = double.maxFinite,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.all(KSizes.md),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = const [],
    this.alignment = Alignment.center,
    this.onTap, this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: clipBehavior ?? Clip.none,
        width: width,
        // height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,

          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
          boxShadow: CustomShadow.getShadow( [
            BoxShadow(
              color: color.withOpacity(0.7),
              offset: const Offset(0, 5),
              blurRadius: 15,
            )
          ]),
        ),
        padding: padding,
        margin: margin,
        alignment: alignment,
        child: child,
      ),
    );
  }
}