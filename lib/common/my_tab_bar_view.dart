import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/model/my_tab_controller.dart';
import 'package:smart_watch_app/common/tab_controller.dart';

export 'package:smart_watch_app/common/model/my_tab_controller.dart';

class MyTabBarView extends StatefulWidget {
  MyTabController controller;
  List<Widget> children;

  MyTabBarView({
    Key key,
    @required this.controller,
    @required this.children
    // @required this.tabs,
  });

  @override
  MyTabBarViewState createState() => new MyTabBarViewState();
}

class MyTabBarViewState extends State<MyTabBarView> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    // 监听tabbar切换页面
    eventBus.on<MyEvent>().listen((MyEvent data) =>
      _onChanged(data.index)
    );
  }
  
  Widget _render() {
    return widget.children[activeIndex];
  }

  _onChanged(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return _render();
  }
}



