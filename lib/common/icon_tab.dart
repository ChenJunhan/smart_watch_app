import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTab extends StatefulWidget {

  const IconTab({
    Key key,
    this.text,
    this.icon,
    this.color
  })
    : assert(text != null || icon != null),
      super(key: key);

  final String text;
  final String icon;
  final Color color;

  @override
  IconTabState createState() => new IconTabState();
}

class IconTabState extends State<IconTab> {

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: ScreenUtil.getInstance().setHeight(118),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             ConstrainedBox(
              child: new Image.asset(
                'assets/images/${widget.icon}'
              //  widget.icon
              ),
              constraints: new BoxConstraints.expand(
                width: ScreenUtil.getInstance().setWidth(50),
                height: ScreenUtil.getInstance().setWidth(50)
              ),
            ),
            new Text(
              widget.text,
              style: new TextStyle(color: widget.color),
            )
          ],
        )
      )
    );
  }
}