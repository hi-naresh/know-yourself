import 'package:flutter/material.dart';
import 'package:knowyourself/utils/constants/enums.dart';

class KColors {
  // App theme colors
  static const Color primary = Color(0xFFAEBFFF);
  static const Color secondary = Color(0xFFFFB999);

  static const Color accent = Color(0xFFb0c7ff);

  static const Color accent1 = Color(0xff9dd7ff);
  static const Color accent1Light = Color(0xffCEEAFF);
  static const Color accent2 = Color(0xFFFFB4E2);
  static const Color accent2Light = Color(0xFFFFD9F0);
  static const Color accent3 = Color(0xFFB4A6FE);
  static const Color accent3Light = Color(0xFFCEC4FF);
  static const Color accent3Dark = Color(0xFF6D6598);

  static const Color accent4 = Color(0xFFFDB9AE);
  static const Color accent4Light = Color(0xFFFFDFD8);

  static const Gradient accent1Gradient = LinearGradient(
    colors: [
      Colors.blue,
      accent1 ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );


  static const Gradient accentPrimaryGradient = LinearGradient(
    colors: [
      primary,
      scaffoldDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  );

  // static List<BoxShadow> defaultShadow =  [
  //   BoxShadow(
  //     color: primary.withOpacity(0.7),
  //     offset: const Offset(0, 5),
  //     blurRadius: 15,
  //   )
  // ];
  //
  // static const Gradient accent3Gradient= LinearGradient(
  //   colors: [
  //     accent3Light,
  //     accent3 ],
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  // );
  //
  // static const Gradient accent4Gradient = LinearGradient(
  //   colors: [
  //     accent4Light,
  //     accent4 ],
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  // );



  // static BoxShadow defaultShadow(accentIn) => BoxShadow(
  //   color: accentIn.withOpacity(0.15),
  //   offset: const Offset(-5, 1.5),
  //   spreadRadius: 1,
  //   blurRadius: 10,
  // );

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  //scaffold color
  static const Color scaffoldLight = Color(0xfff4f3ff);

  static const Color scaffoldDark = Color(0xff1f1f25);

  // Background colors
  static const Color light = Color(0xffe5e5ea);
  static const Color navLight = Color(0xffcecee3);
  static const Color dark = Color(0xff201d34);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  // static const Color lightContainer = Color(0xFFF6F6F6);
  static Color lightContainer = KColors.white.withOpacity(0.5);
  static Color darkContainer = KColors.black.withOpacity(0.05);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = kApp4;
  static const Color success = kApp3;
  static const Color warning = kApp2;
  static const Color info = kApp1;

  // Neutral Shades

  static const Color primaryWhite = Color(0xFFEFEEFF);
  static const Color primaryBlack = Color(0xFF362424);
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFE5E5E5);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

}



// const Color kCoreValue1 = Color(0xFFEF7C00);
// const Color kCoreValue1_1 = Color(0xFFFAC6A1);
// const Color kCoreValue2 = Color(0xFFEFB500);
// const Color kCoreValue2_1 = Color(0xFFF3E1AA);
// const Color kCoreValue3 = Color(0xFFF8D600);
// const Color kCoreValue3_1 = Color(0xFFFCEA9E);
// const Color kCoreValue4 = Color(0xFFB9D900);
// const Color kCoreValue4_1 = Color(0xFFE3F3A5);
// const Color kCoreValue5 = Color(0xFF00AE1B);
// const Color kCoreValue5_1 = Color(0xFFA3E6B4);
// const Color kCoreValue6 = Color(0xFF007530);
// const Color kCoreValue6_1 = Color(0xFF78D59E);
// const Color kCoreValue7 = Color(0xFF005CA5);
// const Color kCoreValue7_1 = Color(0xFF7AB9E6);
// const Color kCoreValue8 = Color(0xFF1C3385);
// const Color kCoreValue8_1 = Color(0xFF49AAEF);
// const Color kCoreValue9 = Color(0xFF692A81);
// const Color kCoreValue9_1 = Color(0xFFA17DE6);
// const Color kCoreValue10 = Color(0xFFBC037B);
// const Color kCoreValue10_1 = Color(0xFFE07FBC);
// const Color kCoreValue11 = Color(0xFFF0025E);
// const Color kCoreValue11_1 = Color(0xFFF676A6);
// const Color kCoreValue12 = Color(0xFFEC0012);
// const Color kCoreValue12_1 = Color(0xFFEF7272);
//

const Color valueProgress = Color(0xFFFAC6A1);
const Color valueReceptivity = Color(0xFFF3E1AA);
const Color valueAspiration = Color(0xFFFCEA9E);
const Color valuePerseverance = Color(0xFFE3F3A5);
const Color valueGratitude = Color(0xFFA3E6B4);
const Color valueHumility = Color(0xFF78D59E);
const Color valueSincerity = Color(0xFF7AB9E6);
const Color valuePeace = Color(0xFF49AAEF);
const Color valueEquanimity = Color(0xFFA17DE6);
const Color valueGenerosity = Color(0xFFE07FBC);
const Color valueGoodness = Color(0xFFF676A6);
const Color valueCourage = Color(0xFFEF7272);

final valueColors ={
  CoreValues.progress: valueProgress,
  CoreValues.receptivity: valueReceptivity,
  CoreValues.aspiration: valueAspiration,
  CoreValues.perseverance: valuePerseverance,
  CoreValues.gratitude: valueGratitude,
  CoreValues.humility: valueHumility,
  CoreValues.sincerity: valueSincerity,
  CoreValues.peace: valuePeace,
  CoreValues.equanimity: valueEquanimity,
  CoreValues.generosity: valueGenerosity,
  CoreValues.goodness: valueGoodness,
  CoreValues.courage: valueCourage,
};

//AppColor1
const Color kApp1 = Color(0xFFAEBFFF);
const Color kApp1Light = Color(0xFFBFDAFF);

//Appcolor2
const Color kApp2 = Color(0xFFFF98BF);
const Color kApp2Light = Color(0xFFFFD7E8);

//appcolor3
const Color kApp3 = Color(0xFF63D5AC);
const Color kApp3Light = Color(0xFFB6F3D4);

//appcolor4
const Color kApp4 = Color(0xFFFFB999);
const Color kApp4Light = Color(0xFFFFCCBF);
const Color kApp4Dark = Color(0xFFFFA497);

//grey
const Color kProgress = Color(0xFFE9EDF1);
Color kBoxLight = kEmptyProgress.withOpacity(0.7);
const Color kPieBox = Color(0xFFEEF6FF);
// const Color kEmptyProgress = Color(0xFFE3E9F3);
const Color kEmptyProgress = Color(0xFFE4E9F3);
const Color kEmptyProgressDark = Color(0xFF353536);

const Color kPrimaryColor = Color(0xFFAEBFFF);
const Color kSecondaryColor = Color(0xFFD9E9FF);
