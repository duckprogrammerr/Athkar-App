import 'package:athkarapp/view/widgets/listview_athkar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_icon.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  HomeScreen({required this.openDrawer});
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                DateTime.now().hour > 12
                    ? "assets/images/night.jpg"
                    : "assets/images/sunset.jpg",
                fit: BoxFit.fill,
                width: size.width,
                height: size.height * .45,
              ),
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .40,
                    color: Colors.black.withOpacity(0.32),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        DrawerIcon(
                          openDrawer: widget.openDrawer,
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          DateTime.now().hour < 12
                              ? "أذكار الصباح"
                              : "أذكار المساء",
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 30,
                            color: Color(0xffeeeeee),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: Color(0xff333333),
                    ),
                    child: ListViewAthkar(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
