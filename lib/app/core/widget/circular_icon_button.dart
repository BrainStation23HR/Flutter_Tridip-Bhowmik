import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';

class CircularIconButton extends StatelessWidget {
  final String imageName;
  final Function()? onTap;

  const CircularIconButton({
    super.key,
    required this.imageName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            // clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(100),
              child: Center(
                child: Ink(
                  padding: mainPadding(12, 12),
                  decoration: BoxDecoration(
                    color: AppColors.circularButtonColor,
                  ),
                  child: Image.asset(
                    imageName,
                    height: 20.w,
                    width: 20.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
