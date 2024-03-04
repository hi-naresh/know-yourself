//make Custom Container widget extended from StatelessWidget

import 'package:flutter/material.dart';
import 'package:knowyourself/utils/ui_colors.dart';


class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  // final double height;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final List<BoxShadow> boxShadow;
  final Alignment alignment;
  final Function()? onTap;

  const CustomContainer({
    required this.child,
    this.width = double.infinity,
    // this.height = double.maxFinite,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = const [

    ],
    this.alignment = Alignment.center,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        // height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: color,
            width: 2,
          ),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(5, 5),
              blurRadius: 15,
            )
          ],
        ),
        padding: padding,
        margin: margin,
        alignment: alignment,
        child: child,
      ),
    );
  }
}