import 'package:flutter/material.dart';
import 'package:smart_watch_app/splash.dart';
import 'package:smart_watch_app/pages/login.dart';
import 'package:oktoast/oktoast.dart';
import 'package:smart_watch_app/pages/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      // 弹出层样式
      position: ToastPosition.bottom,
      backgroundColor: Colors.black.withOpacity(0.6),
      radius: 10.0,
      textStyle: TextStyle(fontSize: 16.0),
      child: MaterialApp(
        title: '大家健康APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          primaryColor: Color(0xFF00C4C9)
          
        ),
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new Login(),
          '/test': (BuildContext context) => new TestPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          // print(12314564);
          // return new SlideRoute(builder: builder);
        },
      )
    );
  }
}

