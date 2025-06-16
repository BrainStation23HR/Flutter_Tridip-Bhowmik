import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle textStyle({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  required double fontSize,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
  bool needUnderline = false,
  bool needCross = false,
}) {
  return TextStyle(
    fontSize: fontSize.sp,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isWhiteColor
            ? AppColors.white
            : color,
    fontWeight: isWeight300
        ? FontWeight.w300
        : isWeight400
            ? FontWeight.w400
            : isWeight500
                ? FontWeight.w500
                : isWeight600
                    ? FontWeight.w600
                    : isWeight700
                        ? FontWeight.w700
                        : isWeight800
                            ? FontWeight.w800
                            : fontWeight,
    height: lineHeight,
    shadows: needShadow
        ? [
            const Shadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 15,
            ),
          ]
        : null,
    decoration: needUnderline ? TextDecoration.underline : null,
    decorationColor: underlineColor,
    decorationStyle: TextDecorationStyle.solid,
  );
}

final hintStyle = GoogleFonts.roboto(
  fontSize: 14.sp,
  color: AppColors.inputColor,
  fontWeight: FontWeight.w400,
);

TextStyle text12Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
  bool needUnderline = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    needUnderline: needUnderline,
    underlineColor: underlineColor,
  );
}

TextStyle text13Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 13,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
  bool needUnderline = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    needUnderline: needUnderline,
    underlineColor: underlineColor,
  );
}

TextStyle text14Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w500,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
  bool needCross = false,
  bool needUnderline = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    needCross: needCross,
    needUnderline: needUnderline,
    underlineColor: underlineColor,
  );
}

TextStyle text16Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
  bool needCross = false,
  bool needUnderline = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    needCross: needCross,
    needUnderline: needUnderline,
    underlineColor: underlineColor,
  );
}

TextStyle text18Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w600,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    underlineColor: underlineColor,
  );
}

TextStyle text20Style({
  Color color = AppColors.black,
  Color underlineColor = Colors.grey,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w800,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isRoboto = true,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isRoboto: isRoboto,
    needShadow: needShadow,
    underlineColor: underlineColor,
  );
}
