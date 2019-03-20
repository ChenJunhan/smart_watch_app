import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconItem extends StatefulWidget {

  const IconItem({
    Key key,
    @required this.icon,       // 图标地址
    @required this.text,       // 文字描述
    this.link                  // 跳转页面路由地址
  })
    : assert(icon != null || text != null || link != null),
      super(key: key);

  final String icon;
  final String text;
  final String link;

  @override
  IconItemState createState() => new IconItemState();
}

class IconItemState extends State<IconItem> {
  @override
  Widget build(BuildContext context) {

    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ConstrainedBox(
                child: Image.asset(widget.icon),
                constraints: BoxConstraints.expand(
                  width: ScreenUtil.getInstance().setWidth(45),
                  height:ScreenUtil.getInstance().setWidth(45)
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0), child: Text(widget.text, textAlign: TextAlign.start)),
            ],
          ),
          ConstrainedBox(
            child: Image.asset('assets/images/arr-1.png'),
            constraints: BoxConstraints.expand(
              width: ScreenUtil.getInstance().setWidth(14),
              height:ScreenUtil.getInstance().setWidth(30)
            ),
          ),
        ],
      ),
      onPressed: () {
        if (widget.link != null) {
          Navigator.of(context).pushNamed(widget.link);
        }else {
          showDialog(
            context: context,
            child: new AlertDialog(
              content: new Text("功能待开发...${widget.link}"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('确定'))
              ],
            )
          );
        }
      },
    );
  }
}