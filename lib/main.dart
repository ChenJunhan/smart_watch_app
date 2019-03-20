import 'package:flutter/material.dart';
import 'package:smart_watch_app/splash.dart';
import 'package:smart_watch_app/pages/login.dart';
import 'package:smart_watch_app/route_animates/slide_route.dart';
import 'package:smart_watch_app/pages/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        print(settings);
        return new SlideRoute(builder: builder);
      },
    );
  }
}

