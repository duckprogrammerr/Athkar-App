import 'package:athkarapp/data/categories_list.dart';
import 'package:athkarapp/utils/appstyle.dart';

import 'package:flutter/material.dart';
import '../widgets/drawer_icon.dart';
import 'athkar_list_screen.dart';

class AthkarScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  AthkarScreen({required this.openDrawer, Key? key}) : super(key: key);

  @override
  _AthkarScreenState createState() => _AthkarScreenState();
}

class _AthkarScreenState extends State<AthkarScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            DrawerIcon(openDrawer: widget.openDrawer),
            GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 30.0,
              padding: EdgeInsets.all(8.0),
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2.0,
              children: SecondAthkarCategories.map((e) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AthkarList(category: e))),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(e, style: AppStyle.TitleTextStyle),
                      decoration: BoxDecoration(
                        color: AppStyle.kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ],
                      ),
                    ),
                  )).toList(),
            )
          ]),
        )),
      ),
    );
  }
}
