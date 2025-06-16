import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../core/constraints/app_constraints.dart';
import 'api_urls.dart';

class ApiClient {
  Dio? dio;
  String token = "";
  String refToken = "";

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<Response?> getAPI(
    String url,
    retry, {
    Map<String, dynamic>? mQueryParameters,
    bool isHeaderRequired = true,
    bool needLoader = true,
    bool? isApplicationJson,
  }) async {
    logger.w('URL:  $url\nQueryParameters: $mQueryParameters');
    appHelper.showLoader(needToShow: needLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {

        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson ?? true) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }
      Response? response = await dio?.get(
        url,
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nQueryParameters: $mQueryParameters\nResponse: $response');
      if (needLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(
        e,
        retry,
        isHeaderRequired,
      );
    }
  }

  Future<Response?> postAPI(
    String url,
    data,
    retry, {
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    Map<String, dynamic>? mQueryParameters,
    needToShowLoader = true,
    needToHideLoader = true,
    needToShowLogoutMsg = true,
    bool isApplicationJson = true,
    bool isContentTypeUrlEncoded = true,
    bool isContentTypeApplicationJson = false,
  }) async {
    appHelper.showLoader(needToShow: needToShowLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {


          dio?.options.headers["Authorization"] = "Bearer $token";


        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
        if (isContentTypeUrlEncoded) {
          dio?.options.headers["Content-Type"] =
              "application/x-www-form-urlencoded";
        } else if (isContentTypeApplicationJson) {
          dio?.options.headers["Content-Type"] = "application/json";
        } else {
          dio?.options.headers["Content-Type"] = "multipart/form-data";
        }
      }
      FormData formData = FormData.fromMap(data);
      logger.d('URL:  $data');
      Response? response = await dio?.post(
        url,
        data: isContentTypeUrlEncoded
            ? data
            : isContentTypeApplicationJson
                ? data
                : formData,
        options: Options(
          contentType: isContentTypeUrlEncoded
              ? Headers.formUrlEncodedContentType
              : isContentTypeApplicationJson
                  ? Headers.jsonContentType
                  : Headers.multipartFormDataContentType,
        ),
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nData: $data\nResponse: $response');
      if (needToHideLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(
        e,
        retry,
        isHeaderRequired,
        needToShowLogoutMsg: needToShowLogoutMsg,
      );
    }
  }

  Future<Response?> putAPI(
    String url,
    data,
    retry, {
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    Map<String, dynamic>? mQueryParameters,
    bool needLoader = true,
    bool isApplicationJson = true,
    bool isContentTypeUrlEncoded = true,
    bool isContentTypeApplicationJson = false,
    bool isContentTypeMultiPart = false,
  }) async {
    appHelper.showLoader(needToShow: needLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {

        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
        if (isContentTypeUrlEncoded) {
          dio?.options.headers["Content-Type"] =
              "application/x-www-form-urlencoded";
        } else if (isContentTypeApplicationJson) {
          dio?.options.headers["Content-Type"] = "application/json";
        } else if (isContentTypeMultiPart) {
          dio?.options.headers["Content-Type"] = "multipart/form-data";
        }
      }
      logger.d('URL:  $data');
      FormData formData = FormData.fromMap(data);
      Response? response = await dio?.put(
        url,
        data: isContentTypeMultiPart ? formData : data,
        options: Options(
            contentType: isContentTypeApplicationJson
                ? Headers.jsonContentType
                : Headers.multipartFormDataContentType),
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nData: $data\nResponse: $response');
      if (needLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(
        e,
        retry,
        isHeaderRequired,
      );
    }
  }

  Future<Response?> deleteAPI(
    String url,
    retry, {
    Map<String, dynamic>? mQueryParameters,
    bool isHeaderRequired = true,
    bool isApplicationJson = true,
  }) async {
    logger.w('URL:  $url\nQueryParameters: $mQueryParameters');
    appHelper.showLoader();
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {

        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }

      Response? response = await dio?.delete(
        url,
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nQueryParameters: $mQueryParameters\nResponse: $response');
      appHelper.hideLoader();
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  exceptionHandler(DioException e, retry, bool isHeaderRequired,
      {needToShowLogoutMsg}) {
    printCatch(e, retry);
    appHelper.hideLoader();
    if (e.error.toString().contains("Connection failed")) {
      Connectivity().checkConnectivity().then((value) {
        if (value.contains(ConnectivityResult.none)) {
          appWidget.showSimpleDialog(
            "You Appear Offline",
            "This feature requires an internet connection.",
            retry,
            buttonText: "Try Again",
          );
        } else {
          appWidget.showSimpleDialog(
            "Failed",
            "Something went wrong. Please try again later.",
            retry,
          );
        }
      });
      return e.response;
    } else if (e.message.toString().contains("connection took longer")) {
      appWidget.showSimpleDialog(
        "Failed",
        "The connection took longer than expected. Please check that you have a proper internet connection and try again.",
        retry,
      );
      return e.response;
    }
    if (e.response?.statusCode == 401) {
      if (isHeaderRequired) {

      }
      return e.response;
    } else if (e.response?.statusCode == 400) {
      return e.response;
    } else if (e.response?.statusCode == 403) {
      return e.response;
    } else if (e.response?.statusCode == 404) {
      return e.response;
    } else if (e.response?.statusCode == 409) {
      return e.response;
    } else if (e.response?.statusCode == 422) {
      return e.response;
    } else if (e.response?.statusCode == 202) {
      return e.response;
    } else if (e.response?.statusCode == 203) {
      return e.response;
    } else if (e.response?.statusCode == 308) {
      return e.response;
    } else if (e.response?.statusCode == 424) {
      return e.response;
    } else if (e.response?.statusCode == 413) {
      return e.response;
    } else if (e.response?.statusCode == 500) {
      return e.response;
    }
  }

  Future<void> printCatch(DioException e, retry) async {
    logger.w('printCatch:  ${e.response?.statusCode}');

    if (e.response != null) {
      logger.w('Error Response data:  ${e.response?.data}');
      logger.w('Error Response headers:  ${e.response?.headers}');
      logger.w('Error Response statusCode:  ${e.response?.statusCode}');
    } else {
      logger.w('Error Response message:  ${e.message}');
    }
  }


}
