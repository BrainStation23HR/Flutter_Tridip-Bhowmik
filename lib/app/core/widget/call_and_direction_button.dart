import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';

class CallAndDirectionButton extends StatelessWidget {
  final String title, icon;
  final Function()? onTap;

  const CallAndDirectionButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.black.withValues(alpha: 0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: .5),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: mainPadding(8, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 16.w,
                width: 16.w,
                color: AppColors.navyBlueColor,
              ),
              gapW8,
              Text(
                title,
                style: text14Style(
                  isWeight400: true,
                  color: AppColors.navyBlueColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
