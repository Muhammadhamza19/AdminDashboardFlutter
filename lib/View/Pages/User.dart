import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return MyWidgetTree(
      dynamicItem: myItem(),
    );
  }

  Widget myItem() {
    return Center(
      child: Container(
        child: Text('User'),
      ),
    );
  }
}
