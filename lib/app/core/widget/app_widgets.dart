import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';
import '../utils/helper/app_helper.dart';

class AppWidgets {
  final bool needScreenUtil = true;

  Widget gapH(double height) {
    return SizedBox(
      height: needScreenUtil ? height.h : height,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: needScreenUtil ? width.w : width,
    );
  }

  Divider divider({
    double height = 10,
    Color color = AppColors.dividerColor,
    double thickness = 0.5,
  }) {
    return Divider(
      color: color,
      height: needScreenUtil ? height.h : height,
      thickness: thickness,
    );
  }

  showSimpleDialog(
    String title,
    String body,
    retryClick, {
    buttonText = "Try Again",
    isErrorMessageBangla = false,
    barrierDismissible = true,
  }) {
    if (Get.context == null) {
      return null;
    }
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          // style: textAppBarStyle(),
        ),
        content: Text(
          body,
          // style: textRegularStyle(),
        ),
        actions: <Widget>[
          TextButton(
              child: Text(
                buttonText == "Try Again"
                    ? (isErrorMessageBangla ? "আবার চেষ্টা করুন" : buttonText)
                    : buttonText,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (buttonText != "Ok") {
                  if (buttonText != "ঠিক আছে") {
                    try {
                      retryClick();
                      AppHelper().showLoader();
                    } catch (e) {
                      AppHelper().hideLoader();
                    }
                  }
                }
              })
        ],
      ),
    );
  }

  showSimpleToast(
    String? message, {
    String? title,
    bool isSuccess = false,
    bool doNeedScreenUtil = false,
    bool isInfo = false,
    bool isErrorMessageBangla = false,
    bool isError = true,
    int duration = 1000,
  }) {
    Get.snackbar(
      title ??
          (isSuccess
              ? "Success"
              : isInfo
                  ?  "Info"
                  : "Error"),
      message ?? "",
      icon: Icon(
        (isSuccess
            ? Icons.check_circle
            : isInfo
                ? Icons.info
                : Icons.error),
        color: AppColors.white,
      ),
      shouldIconPulse: true,
      barBlur: 20,
      overlayBlur: 1,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      backgroundColor: (isSuccess
          ? AppColors.successColor.withValues(alpha: .8)
          : isInfo
              ? AppColors.infoColor.withValues(alpha: .8)
              : AppColors.errorColor.withValues(alpha: .8)),
      margin: EdgeInsets.only(
        top: doNeedScreenUtil ? 20.h : 20,
        left: doNeedScreenUtil ? 20.w : 20,
        right: doNeedScreenUtil ? 20.w : 20,
      ),
      colorText: AppColors.white,
      duration: Duration(milliseconds: duration),
    );
  }

  Future<bool> appExitConfirmation({
    String? msg,
    bool needOnlyBack = false,
    bool isErrorMessageBangla = false,
    EdgeInsetsGeometry? actionsPadding,
  }) async {
    bool? shouldClose = await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        content: Text(
          msg ?? 'Are you sure you want to close application?',
          style: text14Style(),
        ),
        actionsPadding: actionsPadding,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'NO',
              style: text14Style(
                isPrimaryColor: true,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (needOnlyBack) {
                Navigator.of(context).pop(false);
                Navigator.of(context).pop(false);
              } else {
                SystemNavigator.pop();
              }
            },
            child: Text(
              'YES',
              style: text14Style(
                isPrimaryColor: true,
              ),
            ),
          ),
        ],
      ),
    );

    if ((shouldClose ?? false)) {
      Navigator.pop(Get.context!);
    }

    return false;
  }

  Widget noData({msg = "No data found", color = Colors.redAccent}) {
    return Center(
      child: Padding(
        padding: mainPadding(20, 20),
        child: Text(
          msg,
          style: text18Style(color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<DateTime?> datePickerMain(
      {bool canPickFutureDate = true,
      bool canPickFirstDate = false,
      required DateTime initialDate,
      //Todo Need to work here
      DateTime? firstDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: canPickFirstDate
          ? (initialDate.isBefore(firstDate ?? DateTime.now())
              ? firstDate
              : initialDate)
          : initialDate,
      firstDate: canPickFirstDate
          ? (firstDate ?? DateTime.now())
          : DateTime.now().subtract(const Duration(days: 365)),
      lastDate: canPickFutureDate
          ? DateTime.now().add(const Duration(days: 365))
          : DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius here
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      initialDate = pickedDate;
      return initialDate;
    }
    return null;
  }
}
