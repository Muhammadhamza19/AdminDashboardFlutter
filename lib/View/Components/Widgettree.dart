// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:dashboard/View/Components/MyAppBar.dart';
import 'package:dashboard/View/Components/MyDrawer.dart';
import 'package:dashboard/View/Components/Panels/Right_Panel.dart';
import 'package:dashboard/View/Components/Panels/center_panel.dart';
import 'package:dashboard/View/Components/Panels/left_panel.dart';
import 'package:dashboard/utils/ResponsiveLayout.dart';
import 'package:flutter/material.dart';

class MyWidgetTree extends StatefulWidget {
  MyWidgetTree({this.dynamicItem});

  Widget? dynamicItem;

  @override
  State<MyWidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<MyWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLLimit(context)
              ? Container()
              : MyAppBar(),
          preferredSize: Size(double.infinity, 100)),
      body: ResponsiveLayout(
          tiny: Container(),
          mobile: widget.dynamicItem!,
          tablet: Row(children: [
            Expanded(child: widget.dynamicItem!),
          ]),
          largeTablet: Row(children: [
            Expanded(child: widget.dynamicItem!),
          ]),
          desktop: Row(children: [
            MyDrawer(),
            Expanded(child: widget.dynamicItem!),
          ])),
      drawer: MyDrawer(),
    );
  }
}
