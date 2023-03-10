import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget mobile;
  final Widget tablet;
  final Widget largeTablet;
  final Widget desktop;

  const ResponsiveLayout(
      {required this.tiny,
      required this.mobile,
      required this.tablet,
      required this.largeTablet,
      required this.desktop});

  static const int tinyheight = 100;
  static const int tinyLimit = 270;
  static const int mobileLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  static bool isTinyHeightLLimit(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.height < tinyheight;
  static bool isTinyLimit(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.width < tinyLimit;
  static bool isMobileHeightLLimit(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.width < mobileLimit &&
      MediaQuery.of(buildContext).size.width >= tinyLimit;
  static bool isTabletHeightLLimit(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.width < tabletLimit &&
      MediaQuery.of(buildContext).size.width >= mobileLimit;
  static bool isLargeTabletHeightLLimit(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.width < largeTabletLimit &&
      MediaQuery.of(buildContext).size.width >= tabletLimit;
  static bool isComputer(BuildContext buildContext) =>
      MediaQuery.of(buildContext).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
        if (boxConstraints.maxWidth < tinyheight ||
            boxConstraints.maxHeight < tinyheight) {
          return tiny;
        }
        if (boxConstraints.maxWidth < mobileLimit) {
          return mobile;
        }
        if (boxConstraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (boxConstraints.maxWidth < largeTabletLimit) {
          return largeTablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
