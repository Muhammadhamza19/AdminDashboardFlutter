import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MyWidgetTree(
      dynamicItem: myItem(),
    );
  }

  Widget myItem() {
    return Center(
      child: Container(
        child: Text('Setting'),
      ),
    );
  }
}
