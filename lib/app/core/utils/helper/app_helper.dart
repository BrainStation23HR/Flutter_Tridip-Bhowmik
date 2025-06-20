import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  late SharedPreferences prefs;

  Future<void> saveIntPref(String key, int value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<void> deleteIntPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<int?> getIntPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<void> saveStringPref(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> deleteStringPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<String?> getStringPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  void hideLoader() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  showLoader({needToShow = true}) {
    if (needToShow) {
      if (!EasyLoading.isShow) {
        return EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: kDebugMode ? true : false,
        );
      }
    }
  }

  /*String validateImageURL(String url) {
    String finalUrl = url;
    if (url.startsWith("upload")) {
      finalUrl = baseImageUrl + url;
    } else if (url.startsWith("/storage")) {
      finalUrl = baseImageUrl + url;
    } else if (url.contains("https:")) {
      finalUrl = url;
    } else if (!url.contains("/")) {
      finalUrl = baseImageUrl + url;
    } else if (url.startsWith("https")) {
      finalUrl = url;
    } else {
      finalUrl = baseImageUrl + url;
    }
    logger.i("Image url $finalUrl");
    return finalUrl;
  }
*/

  String timeConverter(String? time, {int? hourToAdd}) {
    if (time == null || time == "") {
      return "";
    }
    DateTime? parsedTime = DateFormat("HH:mm:ss").parse(time);

    if (hourToAdd != null) {
      parsedTime = parsedTime.add(Duration(hours: hourToAdd));
    }
    return DateFormat('hh:mm a').format(parsedTime);
  }

  String formatDateForField(DateTime selectedDate, {String? dateFormat}) {
    final formatedDate =
        DateFormat(dateFormat ?? 'dd MMM yyyy, EEEE').format(selectedDate);
    return formatedDate;
  }

  void setStatusBarWhite() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  void setStatusBarBlack() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
