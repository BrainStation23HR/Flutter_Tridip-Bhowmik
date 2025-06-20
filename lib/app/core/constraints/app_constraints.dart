import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../network/api_client.dart';
import '../utils/helper/app_helper.dart';
import '../widget/app_widgets.dart';

final appWidget = AppWidgets();
var logger = Logger();
var appHelper = AppHelper();
var apiClient = ApiClient();

const defaultBorderRadius = 8.0;
double widgetToTitlePadding = 16;
const transitionDuration = 500;
final isComingSoonNeeded = false;

mainBorderRadius(double value) => BorderRadius.circular(value.r);

final imageMaxWidth = Platform.isIOS ? 1024.0 : null;
final imageMaxHeight = Platform.isIOS ? 1920.0 : null;

// const String gitAccessToken = "";


const Transition transition = Transition.fadeIn;
final Widget gapW3 = appWidget.gapW(3);
final Widget gapW6 = appWidget.gapW(6);
final Widget gapW8 = appWidget.gapW(8);
final Widget gapW12 = appWidget.gapW(12);
final Widget gapW16 = appWidget.gapW(16);
final Widget gapW18 = appWidget.gapW(18);
final Widget gapW20 = appWidget.gapW(20);
final Widget gapW24 = appWidget.gapW(24);
final Widget gapW30 = appWidget.gapW(30);
final Widget gapW34 = appWidget.gapW(34);

final Widget gapH3 = appWidget.gapH(3);
final Widget gapH6 = appWidget.gapH(6);
final Widget gapH8 = appWidget.gapH(8);
final Widget gapH12 = appWidget.gapH(12);
final Widget gapH16 = appWidget.gapH(16);
final Widget gapH18 = appWidget.gapH(18);
final Widget gapH20 = appWidget.gapH(20);
final Widget gapH24 = appWidget.gapH(24);
final Widget gapH30 = appWidget.gapH(30);
final Widget gapH32 = appWidget.gapH(32);
final Widget gapH42 = appWidget.gapH(42);
final Widget gapH48 = appWidget.gapH(48);

Widget gapH(double height) => appWidget.gapH(height);

EdgeInsetsGeometry mainPadding(double leftRight, double topBottom,
    {double? leftPadding,
    double? rightPadding,
    double? topPadding,
    double? bottomPadding,
    bool needScreenUtil = false}) {
  return EdgeInsets.only(
    left: needScreenUtil
        ? (leftPadding ?? leftRight).w
        : (leftPadding ?? leftRight),
    right: needScreenUtil
        ? (rightPadding ?? leftRight).w
        : (rightPadding ?? leftRight),
    top: needScreenUtil
        ? (topPadding ?? topBottom).h
        : (topPadding ?? topBottom),
    bottom: needScreenUtil
        ? (bottomPadding ?? topBottom).h
        : (bottomPadding ?? topBottom),
  );
}
