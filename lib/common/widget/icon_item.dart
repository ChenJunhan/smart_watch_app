import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/route_animates/slide_route.dart';

class IconItem extends StatefulWidget {

  const IconItem({
    Key key,
    @required this.icon,       // 图标地址
    @required this.text,       // 文字描述
    this.link,                 // 跳转页面路由地址
    this.widget,               // 跳转widget
  })
    : assert(icon != null || text != null),
      super(key: key);

  final String icon;
  final String text;
  final String link;
  final Widget widget;

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
        }else if (widget.widget != null) {
          // 跳转到对应的widget
          Navigator.push( context,
            new SlideRoute(builder: (context) {
                  return widget.widget;
          }));
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