import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return MyWidgetTree(
      dynamicItem: myItem(),
    );
  }

  Widget myItem() {
    return Center(
      child: Container(
        child: Text('Notification'),
      ),
    );
  }
}
