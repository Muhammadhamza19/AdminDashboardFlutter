import 'package:dashboard/View/Components/Widgettree.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return MyWidgetTree(
      dynamicItem: myItem(),
    );
  }

  Widget myItem() {
    return Center(
      child: Container(
        child: Text('Sales'),
      ),
    );
  }
}
