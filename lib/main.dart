import 'package:dashboard/View/Components/MyDrawer.dart';
import 'package:dashboard/utils/AppPages.dart';
import 'package:dashboard/utils/Constants.dart';
import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:dashboard/utils/GetRouteDelegate.dart';
import 'package:dashboard/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyAppRunner());
}

class MyAppRunner extends StatelessWidget {
  const MyAppRunner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    String defaultRoute = dashboard;
    return GetMaterialApp.router(
      defaultTransition: Transition.fadeIn,
      getPages: AppPages(defaultRoute: defaultRoute).homePageWithSignup,
      // ? AppPages(defaultRoute: defaultRoute)
      // : Ap,
      // (defaultRoute == error)
      //     ? AppPages(defaultRoute: defaultRoute).errorPage
      //     : AppPages(defaultRoute: defaultRoute).homePageWithSignup,,
      routerDelegate: AppRouterDelegate(defaultRoute: defaultRoute),
      title: "decibel_career_portal",
      debugShowCheckedModeBanner: false,
    );
  }
}
