import 'package:athkarapp/utils/appstyle.dart';
import 'package:athkarapp/view/widgets/drawer_icon.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  CounterScreen({required this.openDrawer});
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343434),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DrawerIcon(openDrawer: widget.openDrawer),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("عداد الأستغفار", style: AppStyle.TitleTextStyle),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        setState(() => count++);
                      },
                      borderRadius: BorderRadius.circular(55),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child:
                                Text("$count", style: AppStyle.TitleTextStyle)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
