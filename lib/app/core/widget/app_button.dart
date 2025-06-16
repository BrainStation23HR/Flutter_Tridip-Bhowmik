import 'package:flutter/material.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';

class AppButton extends StatelessWidget {
  final Color? textColor, backgroundColor, borderColor;
  final double fontSize, borderRadius;
  final void Function()? onPressed;
  final String label;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.textColor,
    this.fontSize = 14,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ??
          (onPressed == null ? Color(0xff6A89BD) : AppColors.primaryColor),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 1,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.white.withValues(alpha: 0.3),
        highlightColor: Colors.white.withValues(alpha: 0.1),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: mainPadding(20, 12),
            child: Center(
              child: Text(
                label,
                style: text14Style(
                  fontSize: fontSize,
                  color: textColor ?? AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
