import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:smart_watch_app/pages/equipment_infomation.dart';
import 'package:smart_watch_app/route_animates/slide_route.dart';
import 'package:smart_watch_app/pages/bind_device.dart';

class Attention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    // 设备信息按钮
    Widget equipmentButton = new FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(ScreenUtil.getInstance().setHeight(30)),
      color: Colors.white,
      child: new Container(
        width: ScreenUtil.getInstance().setWidth(690),
        color: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ConstrainedBox(
                      child: new Image.asset('assets/images/a-3.png'),
                      constraints:  new BoxConstraints.expand(
                        width: ScreenUtil.getInstance().setWidth(60),
                        height:ScreenUtil.getInstance().setWidth(60)
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
                      child: new Text('爸爸')
                    )
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(25)),
                  child: new Row(
                    children: <Widget>[
                      ConstrainedBox(
                        child: new Image.asset('assets/images/a-1.png'),
                        constraints:  new BoxConstraints.expand(
                          width: ScreenUtil.getInstance().setWidth(60),
                          height:ScreenUtil.getInstance().setWidth(60)
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
                        child: new Text('设备掉线')
                      )
                    ],
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              child: new Image.asset('assets/images/arr-1.png'),
              constraints: new BoxConstraints.expand(
                width: ScreenUtil.getInstance().setWidth(18),
                height: ScreenUtil.getInstance().setHeight(30)
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        // 跳转到设备信息页面
        Navigator.push( context,
          new SlideRoute(builder: (context) {
                return new EquipmentInfomation();
            }));
      },
    );
      
    return new Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: new Container(
        width: ScreenUtil.getInstance().setWidth(750),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,      // 纵轴对齐方式
          children: <Widget>[
            GradientAppBar(
              title: '关注',
              customButton: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: ScreenUtil.getInstance().setSp(40), 
                ),
                onPressed: () {
                  // 跳转到绑定设备页面
                  Navigator.push( context,
                    new SlideRoute(builder: (context) {
                          return new BindDevice();
                      }));
                },
              ),
            ),

            new Container(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(25), horizontal: ScreenUtil.getInstance().setWidth(25)),
              child: new Column(
                children: <Widget>[
                  equipmentButton,
                ],
              )
            )
          ],
        )
      ),
    );
  }
}