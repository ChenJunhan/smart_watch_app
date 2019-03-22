import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconText extends StatelessWidget {
  final String icon;
  final String title;
  final int iconWidth;
  final int iconHeight;
  final int bottomPadding;

  IconText({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.iconWidth,
    @required this.iconHeight,
    this.bottomPadding = 0
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil.getInstance().setWidth(bottomPadding)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(20)),
            child: Image.asset(
              icon,
              width:ScreenUtil.getInstance().setWidth(iconWidth),
              height: ScreenUtil.getInstance().setHeight(iconHeight),
              fit: BoxFit.cover,
            ),
          ),

          Text(title)
        ],
      ));
  }
}