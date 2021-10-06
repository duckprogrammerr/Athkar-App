import 'package:athkarapp/utils/appstyle.dart';
import 'package:athkarapp/view/screens/athkar_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:athkarapp/data/categories_list.dart' show MainAthkarCategories;

class ListViewAthkar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, i) {
        return AthkarItem(
          text: MainAthkarCategories[i],
          imageFile: 'assets/images/$i.png',
        );
      },
      itemCount: MainAthkarCategories.length,
    );
  }
}

class AthkarItem extends StatelessWidget {
  final String text;
  final String imageFile;
  const AthkarItem({
    required this.text,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => AthkarList(category: text))),
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 130,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppStyle.kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(text, style: AppStyle.TitleTextStyle),
            Image.asset(
              imageFile,
              width: 60,
            ),
          ],
        ),
      ),
    );
  }
}
