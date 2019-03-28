import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:smart_watch_app/common/widget/icon_item.dart';
import 'package:smart_watch_app/pages/modify_password.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[
            GradientAppBar(title: '个人中心'),

            Stack(
              overflow: Overflow.visible,   // 超出不隐藏
              children: <Widget>[
                
                // 头部背景
                ConstrainedBox(
                  child: Image.asset('assets/images/top-bg.png', fit: BoxFit.fill),
                  constraints: BoxConstraints.expand(
                    width: ScreenUtil.getInstance().setWidth(750),
                    height: ScreenUtil.getInstance().setHeight(265)
                  ),
                ),
                
                // 个人信息按钮
                Positioned(
                  bottom: ScreenUtil.getInstance().setHeight(-20),
                  left: ScreenUtil.getInstance().setWidth(30),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      width: ScreenUtil.getInstance().setWidth(690),
                      height: ScreenUtil.getInstance().setHeight(190),
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(40)),
                                child: ClipOval(
                                  child: new Image.asset(
                                      'assets/images/avtar.png', 
                                      fit: BoxFit.cover,
                                      width: ScreenUtil.getInstance().setWidth(145),
                                      height: ScreenUtil.getInstance().setWidth(145),
                                    ),
                                  ),
                              ),
                              
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    '18124089926', 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: ScreenUtil.getInstance().setSp(36)
                                  )),
                                  new Text('ID:18124089926', style: TextStyle(color: Color(0xFFCCCCCC)),)
                                ],
                              )
                            ],
                          ),

                          Image.asset(
                            'assets/images/arr-1.png',
                            width: ScreenUtil.getInstance().setWidth(20),
                            height: ScreenUtil.getInstance().setHeight(30),
                          )
                        ],
                      )
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        child: new AlertDialog(
                          content: new Text("功能待开发..."),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: new Text('确定'))
                          ],
                        )
                      );
                    },
                  )
                )
              ],
            ),

            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(30), ScreenUtil.getInstance().setWidth(70), ScreenUtil.getInstance().setWidth(30), 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)), 
                    child: IconItem(icon: 'assets/images/my-1.png', text: '修改密码',
                    // link: '/login' 
                    widget: ModifyPassword(activePage: 0,)
                    ),
                  ),
                  Divider(height: 0),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)), 
                    child: IconItem(icon: 'assets/images/my-2.png', text: '意见反馈', link: '/login'),
                  ),
                  Divider(height: 0),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)), 
                    child: IconItem(icon: 'assets/images/my-3.png', text: '关于我们', link: null),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}