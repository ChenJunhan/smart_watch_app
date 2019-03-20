import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//自定义一个渐变的标题栏
class GradientAppBar extends StatelessWidget {
  final String title;         // 标题名称
  final bool showBefore;      // 显示返回按钮
  final int barHeight = 70;   //标题栏高度
  final Widget customButton;

  GradientAppBar({
    Key key,
    @required this.title, 
    this.showBefore = false,   // 默认不显示
    this.customButton = null,
  });

  @override
  Widget build(BuildContext context) {

    //获取系统状态栏高度
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + ScreenUtil.getInstance().setHeight(barHeight),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFA6B1FB),
            const Color(0xFF42BCDC),
            const Color(0xFF0AC3CB),
          ]
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[

          // 返回按钮
          Expanded(
            flex: 1,
            child: showBefore ? IconButton(
              alignment: Alignment.bottomLeft,
              icon: Icon(
                Icons.navigate_before,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(40),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ) : Container(),
          ),

          // 标题
          Expanded(
            flex: 4,
            child: new Center(
              child: new Text(
                title,
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  fontWeight: FontWeight.w400, //字体宽度。
                ),
              )
            ),
          ),

          // 自定义按钮
          Expanded(
            flex: 1,
            child: customButton != null ? customButton : Container(),
          )

        ],
      ),
    );
  }
}