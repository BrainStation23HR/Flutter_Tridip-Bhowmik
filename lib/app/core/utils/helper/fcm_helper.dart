// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:human_hr/app/core/constants/app_colors.dart';
// import 'package:human_hr/app/core/constants/app_constants.dart';
// import 'package:soft_builder/constraints/my_constraints.dart';
//
// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// class FCMHelper {
//   initLocalNotification() async {
//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         'HR Payroll',
//         'General',
//         description: 'This channel is used for general notifications.',
//         importance: Importance.max,
//         enableLights: true,
//         enableVibration: true,
//       );
//
//       flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//       /*const AndroidInitializationSettings initializationSettingsAndroid =
//           AndroidInitializationSettings('notification_icon');
//       */ /*final DarwinInitializationSettings initializationSettingsDarwin =
//           DarwinInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//       );*/ /*
//       final InitializationSettings initializationSettings =
//           InitializationSettings(
//         android: initializationSettingsAndroid,
//         // iOS: initializationSettingsDarwin,
//       );
//       await flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse response) {
//           logger.d('initLocalNotification:  ${response.payload}');
//         },
//       );*/
//
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   }
//
//   /*Future<void> selectNotification(String payload) async {
//     // handle the click action here
//     if (payload != null) {
//       print('notification payload: $payload');
//     }
//     // Navigate to the desired screen or perform any action
//   }*/
//
//   localNotificationListener() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       logger.d('main localNotificationListener:  ${message.data}');
//       RemoteNotification? notification = message.notification;
//       logger.i("Notification Body ${notification?.body}");
//       AndroidNotification? android = message.notification?.android;
//       bool canGotoSpecificPage = message.data.containsKey("url");
//       myWidget.showSimpleDialog(
//         notification?.title ?? "",
//         notification?.body ?? "",
//         () {
//           if (canGotoSpecificPage) {
//             appHelper.onGoDetails(message.data["url"]);
//           } else {
//             Get.back();
//           }
//         },
//         buttonText: canGotoSpecificPage ? "Goto Details" : "Ok",
//       );
//
//       if (notification != null && android != null && !kIsWeb) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: 'notification_icon',
//               color: AppColor.white,
//               importance: Importance.max,
//               priority: Priority.high,
//               ongoing: true,
//               styleInformation: const BigTextStyleInformation(''),
//             ),
//           ),
//         );
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       logger.d('A new onMessageOpenedApp event was published!');
//       logger.d('localNotificationListener:  ${message.data}');
//       logger.d('Notification Body 1 :  ${message.notification?.body}');
//       appHelper.onGoDetails(message.data["url"]);
//     });
//
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       logger.d('localNotificationListener:  ${message?.data}');
//       logger.d('Notification Body 2:  ${message?.notification?.body}');
//       if (message != null) {
//         Future.delayed(const Duration(milliseconds: 2500), () {
//           appHelper.onGoDetails(message.data["url"]);
//         });
//       }
//     });
//   }
// }
