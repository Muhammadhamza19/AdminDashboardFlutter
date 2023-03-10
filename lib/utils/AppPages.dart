// import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:dashboard/View/Pages/Contact.dart';
import 'package:dashboard/View/Pages/HomePage.dart';
import 'package:dashboard/View/Pages/Marketing.dart';
import 'package:dashboard/View/Pages/Sales.dart';
import 'package:dashboard/View/Pages/Security.dart';
import 'package:dashboard/View/Pages/Settings.dart';
import 'package:dashboard/View/Pages/Notification.dart';
import 'package:dashboard/View/Pages/User.dart';
import 'package:dashboard/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  String defaultRoute = "";

  AppPages({required defaultRoute});
  final homePageWithSignup = [
    GetPage(
      name: dashboard,
      page: () => Homepage(),
    ),
    GetPage(
      name: setting,
      page: () => SettingPage(),
    ),
    GetPage(
      name: notification,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: contacts,
      page: () => Contact(),
    ),
    GetPage(
      name: sales,
      page: () => Sales(),
    ),
    GetPage(
      name: security,
      page: () => Security(),
    ),
    GetPage(
      name: user,
      page: () => User(),
    ),
    GetPage(
      name: marketing,
      page: () => Marketing(),
    ),
  ];
}
