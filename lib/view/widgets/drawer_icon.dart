import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerIcon extends StatelessWidget {
  final VoidCallback openDrawer;
  DrawerIcon({required this.openDrawer});
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: openDrawer,
        splashColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: SvgPicture.asset('assets/images/menu_.svg'),
        ),
      ),
    );
  }
}
