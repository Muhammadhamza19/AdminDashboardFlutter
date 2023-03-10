import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return MyWidgetTree(
      dynamicItem: myItem(),
    );
  }

  Widget myItem() {
    return Center(
      child: Container(
        child: Text('Contact'),
      ),
    );
  }
}
