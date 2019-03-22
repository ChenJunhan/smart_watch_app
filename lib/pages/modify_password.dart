/*
 * @Author: ChenJunhan 
 * @Date: 2019-03-21 14:26:05 
 * @Last Modified by: ChenJunhan
 * @Last Modified time: 2019-03-21 16:49:33
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/my_tab_bar.dart';
import 'package:smart_watch_app/widgets/render_forget_password.dart';
import 'package:smart_watch_app/widgets/render_modify_password.dart';

class ModifyPassword extends StatefulWidget {
  int activePage;          // 0：修改密码页面; 1：忘记密码页面

  ModifyPassword({
    Key key,
    @required this.activePage
  })
    : assert(activePage != null),
      super(key: key);

  @override
  ModifyPasswordState createState() => new ModifyPasswordState();
}

class ModifyPasswordState extends State<ModifyPassword> {
  MyTabController _controller;

  @override
  void initState() {
    super.initState();

    // 初始化
    _controller = new MyTabController(activeIndex: widget.activePage);
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
                      tab: ['修改密码', '忘记密码'],
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
                    RenderModifyPassword(),
                    RenderForgetPassword()
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