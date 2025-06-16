import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_text_style.dart';

class MyRichText extends StatelessWidget {
  final String firstText, middleText, endText;
  final Color firstTextColor, middleTextColor, endTextColor;
  final bool isEndWeight600, isEndWeight400, needMiddleText;
  final FontWeight firstTextFontWeight,
      middleTextFontWeight,
      secondTextFontWeight;
  final double firstFontSize, middleTextFontSize, secondFontSize;
  final Function()? onTap;

  const MyRichText({
    super.key,
    required this.firstText,
    required this.endText,
    this.middleText = "",
    this.onTap,
    this.firstTextColor = AppColors.lightTextGrey,
    this.endTextColor = AppColors.primaryColor,
    this.middleTextColor = AppColors.primaryColor,
    this.isEndWeight600 = false,
    this.isEndWeight400 = false,
    this.needMiddleText = false,
    this.firstTextFontWeight = FontWeight.w400,
    this.middleTextFontWeight = FontWeight.w400,
    this.firstFontSize = 14,
    this.middleTextFontSize = 14,
    this.secondFontSize = 14,
    this.secondTextFontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$firstText ",
        style: text14Style(
          color: firstTextColor,
          fontSize: firstFontSize,
          isWeight400: true,
          fontWeight: firstTextFontWeight,
        ),
        children: [
          if (needMiddleText)
            TextSpan(
              text: middleText,
              style: text14Style(
                color: middleTextColor,
                fontSize: middleTextFontSize,
                isWeight600: isEndWeight600,
                isWeight400: isEndWeight400,
                fontWeight: middleTextFontWeight,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          TextSpan(
            text: endText,
            style: text14Style(
              color: endTextColor,
              fontSize: secondFontSize,
              isWeight600: isEndWeight600,
              isWeight400: isEndWeight400,
              fontWeight: secondTextFontWeight,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
