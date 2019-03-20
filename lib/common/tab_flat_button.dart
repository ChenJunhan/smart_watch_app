import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabFlatButton extends StatefulWidget {
  String title;
  bool isActive;        // 是否激活
  Function callBack;

  TabFlatButton({
    Key key,
    @required this.title,
    this.isActive: false,
    this.callBack
  })
    :super(key: key);

  @override
  TabFlatButtonState createState() => TabFlatButtonState();
}

class TabFlatButtonState extends State<TabFlatButton> {
  
  int textSize;                    // 字体大小
  Color borderColor;               // 下划线颜色

  @override
  void initState() {
    super.initState();
  }

  _changeFontSize() {

    widget.callBack();
    
    setState(() {
      widget.isActive = !widget.isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: ScreenUtil.getInstance().setWidth(110),
      padding: EdgeInsets.all(0),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(100),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: widget.isActive ? Color(0xFF04C4C9) : Colors.transparent,
            width: 2.0
          ))
        ),
        child: Align(
          alignment: FractionalOffset(0.5, 0.5),             // 字体垂直对齐
          child: AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(widget.isActive ? 48 : 24), color: Colors.black),
            duration: Duration(
              milliseconds: 200
            ),
            child: Text(widget.title),
          ),
        )
      ),
      onPressed: _changeFontSize,
    );
  }
}