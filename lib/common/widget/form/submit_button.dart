import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  String title;                      // 文字
  Function callback;                 // 回调函数

  SubmitButton({
    Key key,
    @required this.title,
    this.callback
  })
   : assert(title != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        // 阴影
        boxShadow: <BoxShadow>[
          new BoxShadow (
            color: const Color(0xff03C4C9),
            offset: new Offset(0.0, 2.0),
            blurRadius: 15.0,
          ),
        ], 
        // 圆角
        borderRadius: new BorderRadius.all(
          const Radius.circular(50.0),
        ), 
      ),
      child: RaisedButton(
        padding: EdgeInsets.all(ScreenUtil.getInstance().setHeight(25)),
        child: Text(title, style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(32)),),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
        onPressed: callback,
      ),
    );
  }
}