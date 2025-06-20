import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_text_style.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title, onActionTitle;
  final IconData iconTitle;
  final bool needAction,
      needLeadingIcon,
      needIcon,
      needTitleCentre,
      needBadge,
      needBorderIcon,
      isWhiteStatusBar;
  final Function()? onActionPressed, backTap, listViewClick, calendarViewClick;
  final Widget? switchButton;

  const AppAppbar({
    super.key,
    required this.title,
    this.needAction = false,
    this.needIcon = false,
    this.needBadge = false,
    this.needTitleCentre = true,
    this.needBorderIcon = false,
    this.isWhiteStatusBar = false,
    this.iconTitle = Icons.add,
    this.onActionPressed,
    this.onActionTitle = "",
    this.switchButton,
    this.backTap,
    this.listViewClick,
    this.calendarViewClick,
    this.needLeadingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 50.w,
      centerTitle: needTitleCentre,
      scrolledUnderElevation: 0,
      leading: needLeadingIcon
          ? Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            highlightColor: AppColors.white.withValues(alpha: 0.2),
            onTap: backTap ??
                    () {
                  Get.back();
                },
            child: Ink(
              // padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff475467),
                size: 16.w,
              ),
            ),
          ),
        ),
      )
          : null,
      title: Text(
        title,
        style: text16Style(
            isWeight400: true, letterSpacing: 0),
      ),
      systemOverlayStyle: isWhiteStatusBar
          ? SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      )
          : SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
