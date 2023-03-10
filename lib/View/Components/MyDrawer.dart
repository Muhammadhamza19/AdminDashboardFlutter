// ignore_for_file: prefer_const_constructors

import 'package:dashboard/utils/Constants.dart';
import 'package:dashboard/utils/ResponsiveLayout.dart';
import 'package:dashboard/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  var items;
  Function? fun;
  MyDrawer({this.items, this.fun});

  // final String title;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.purpleLight,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constants.hpadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Admin Menu",
                  style: TextStyle(color: Constants.TextColor),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Constants.TextColor,
                        )),
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentindex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Constants.bluelight.withOpacity(0.5),
                                Constants.bluelight.withOpacity(0.5)
                              ]))
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title!,
                          style: TextStyle(color: Constants.TextColor),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.hpadding),
                          child: Icon(
                            _buttonNames[index].iconData,
                            color: Constants.TextColor,
                          ),
                        ),
                        onTap: () {
                          switch (_buttonNames[index].title) {
                            case "Home":
                              Get.rootDelegate.toNamed(dashboard);
                              break;
                            case "Setting":
                              Get.rootDelegate.toNamed(setting);

                              break;
                            case "Notification":
                              Get.rootDelegate.toNamed(notification);
                              break;
                            case "Contacts":
                              Get.rootDelegate.toNamed(contacts);
                              break;
                            case "Sales":
                              Get.rootDelegate.toNamed(sales);
                              break;
                            case "Marketing":
                              Get.rootDelegate.toNamed(marketing);
                              break;
                            case "Security":
                              Get.rootDelegate.toNamed(security);
                              break;
                            case "User":
                              Get.rootDelegate.toNamed(user);
                              break;
                            default:
                          }
                          setState(() {
                            _currentindex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Divider(
                      color: Constants.TextColor,
                      thickness: 0.1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButtonInfo {
  String? title;
  IconData? iconData;
  MyButtonInfo({required this.title, required this.iconData});
}

int _currentindex = 0;
List<MyButtonInfo> _buttonNames = [
  MyButtonInfo(title: "Home", iconData: Icons.home),
  MyButtonInfo(title: "Setting", iconData: Icons.settings),
  MyButtonInfo(title: "Notification", iconData: Icons.notifications),
  MyButtonInfo(title: "Contacts", iconData: Icons.contact_phone_rounded),
  MyButtonInfo(title: "Sales", iconData: Icons.sell),
  MyButtonInfo(title: "Marketing", iconData: Icons.mark_email_read),
  MyButtonInfo(title: "Security", iconData: Icons.verified_user),
  MyButtonInfo(title: "User", iconData: Icons.supervised_user_circle_rounded),
];
