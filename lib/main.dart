import 'package:athkarapp/utils/appstyle.dart';
import 'package:athkarapp/view/screens/home_screen.dart';
import 'package:athkarapp/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'view/screens/athkar_categories_screen.dart';
import 'view/screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Athkar App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyle.kPrimaryColor,
        fontFamily: 'Amiri',
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  String item = 'الصفحة الرئيس';
  void openDrawer() {
    setState(() {
      xOffset = -80;
      yOffset = 100;
      scaleFactor = 0.8;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildDrawer(), buildPage()]));
  }

  Widget buildDrawer() {
    return DrawerWidget(onSelectedItem: (item) {
      setState(() => this.item = item);
      closeDrawer();
    });
  }

  Widget buildPage() {
    return GestureDetector(
      onTap: closeDrawer,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(
          milliseconds: 250,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
          child: getDrawerPage(),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case 'ادعية دينية':
        return AthkarScreen(openDrawer: openDrawer);
      case 'عداد استغفار':
        return CounterScreen(openDrawer: openDrawer);
      default:
        return HomeScreen(openDrawer: openDrawer);
    }
  }
}
