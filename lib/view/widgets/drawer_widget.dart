import 'package:athkarapp/data/pages_list.dart';
import 'package:athkarapp/utils/appstyle.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<String> onSelectedItem;
  DrawerWidget({required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: drawerItems.map(
            (item) {
              return InkWell(
                onTap: () => onSelectedItem(item),
                child: Container(
                  margin: EdgeInsets.all(
                    20.0,
                  ),
                  child: Text(item, style: AppStyle.TitleTextStyle),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
