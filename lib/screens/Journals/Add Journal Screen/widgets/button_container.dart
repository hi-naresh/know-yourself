import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowyourself/screens/widgets/CustomTitles.dart';
import 'package:knowyourself/utils/ui_colors.dart';

class ButtonContainer extends StatelessWidget {
  final String label;
  final Function() onTap;
  const ButtonContainer({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: kApp1,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: kApp1,
            width: 2,
          ),
          boxShadow: [
              BoxShadow(
                color: kApp1.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: customTitleBold(kWhite, 19.sp, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
