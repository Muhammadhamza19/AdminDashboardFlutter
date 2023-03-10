import 'package:dashboard/View/Components/HoverAnimination.dart';
import 'package:dashboard/View/Components/Searchbar.dart';
import 'package:dashboard/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard/utils/ResponsiveLayout.dart';
// import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

List<String> _butoonNames = ["Overview", "Revenue", "Sales"];
int _currentStateform = 0;

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  static final data = [
    'Lion',
    'Tiger',
    'Shark',
    'Snake',
    'Bear',
    'Crocodile',
    'Monkey'
  ];
  String currentItem = "";
  @override
  void initState() {
    currentItem = _butoonNames[0];
    super.initState();
  }

  bool SearchBar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Constants.purpleLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(5, 5),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.hpadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                child: Image.asset('assets/Images/Decibel_Icon.png'),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 20,
              color: Constants.TextColor,
              icon: const Icon(Icons.menu),
            ),
          const SizedBox(
            width: Constants.hpadding,
          ),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _butoonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentStateform = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.hpadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _butoonNames[index],
                        style: TextStyle(
                            color: _currentStateform == index
                                ? Constants.TextColor
                                : Constants.TextColor),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Constants.hpadding),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: _currentStateform == index
                                ? const LinearGradient(colors: [
                                    Constants.bluelight,
                                    Constants.bluelight
                                  ])
                                : null),
                        child: OnHover(
                          builder: (isHovered) {
                            final color =
                                isHovered ? Colors.blue : Colors.black;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(data[index].toString()),
                                  ],
                                );
                              },
                            );

                            // return DropdownMenuItem(
                            //   child: Text(data[index]),
                            //   value: data,
                            // );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.hpadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _butoonNames[_currentStateform],
                    style: const TextStyle(color: Constants.TextColor),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.hpadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Constants.bluelight,
                      Constants.bluelight
                    ])),
                  )
                ],
              ),
            ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: IconButton(
              color: Constants.TextColor,
              iconSize: 30,
              onPressed: () {
                // SearchBar = true;
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
                // setState(() {});
              },
              icon: Icon(Icons.search),
            ),
          ),
          // DropdownButton(
          //   value: initial,
          //   icon: Icon(Icons.keyboard_arrow_down),
          //   items: Textpage.texts.map(String items) {
          //     return DropdownMenuItem(
          //         value: items,
          //         child: OnHover(
          //            //Wraping the DropDownMenuItem child so then when Items of drop down is hovering we see hovering effect
          //           builder: (isHovered){
          //             final color = isHovered ? Colors.blue:Colors.black;
          //             return Text('$items',style: TextStyle(color: color),);
          //           },
          //         ));
          //   },
          //   onChanged: (String? newvalue){
          //     setState(() {
          //       initial = newvalue!;
          //     });
          //   },
          // ),

          Container(
            child: Stack(
              children: [
                PopupMenuButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'filter1',
                      child: Text('Filter 1'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'filter2',
                      child: Text('Filter 2'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'clearFilters',
                      child: Text('Clear filters'),
                    ),
                  ],
                ),
                // IconButton(
                //   // color: Constants.TextColor,
                //   // iconSize: 30,

                //   onPressed: () {
                //     // print("object");
                //   },
                //   icon: const Icon(Icons.notifications_none_outlined),
                // ),
                const Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 8,
                    // child: Image.asset(""),
                    child: Text(
                      "3",
                      style:
                          TextStyle(fontSize: 10, color: Constants.TextColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (!ResponsiveLayout.isMobileHeightLLimit(context))
            Container(
              margin: const EdgeInsets.all(Constants.hpadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, -120),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Image.asset('assets/Images/Decibel_Icon.png'),
              ),
            ),
        ],
      ),
    );
  }
}
