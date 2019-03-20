import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/gradient_app_bar.dart';
import 'package:smart_watch_app/common/my_tab_bar.dart';

import 'package:smart_watch_app/widgets/render_login.dart';
import 'package:smart_watch_app/widgets/render_register.dart';

class Login extends StatefulWidget {

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  MyTabController _controller;


  @override
  void initState() {
    super.initState();

    // 初始化
    _controller = new MyTabController(activeIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 注册页面
  Widget renderRegistry() {
    return Column(
      children: <Widget>[

      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    //获取系统状态栏高度
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: statusBarHeight),
        child: Container(
          padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(60)),
          width: ScreenUtil.getInstance().setWidth(750),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/login-1.png',
                width: ScreenUtil.getInstance().setWidth(220),
                height: ScreenUtil.getInstance().setWidth(220),  
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(110)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyTabBar(
                      controller: _controller,
                    )
                  ],
                ),
              ),
              
              Container(
                padding:EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(50)),
                child: MyTabBarView(
                  controller: _controller,
                  children: <Widget>[
                    RenderLogin(),
                    RenderRegister()
                  ],
                ),
              )
              
            ]
          ),
        )
      ),
    );
  }
}

