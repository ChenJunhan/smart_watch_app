import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/route_animates/fade_route.dart';
import 'package:smart_watch_app/navigation.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    
    super.initState();
    //设置启动图生效时间
    var _duration = new Duration(seconds: 2);
    new Timer(_duration, () {
        // 跳转并摧毁当前页面
        Navigator.of(context).pushAndRemoveUntil(FadeRoute(builder: (context) {
          return Navigation();   //跳转到主页
       }), (Route route) => route == null);
    });

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: ConstrainedBox(
        child: new Image.asset(
          'assets/images/welcome.png',
          fit: BoxFit.fill,
        ),
        constraints: new BoxConstraints.expand(),
      )
    ); 
  }
}