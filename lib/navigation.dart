import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_watch_app/common/icon_tab.dart';
import 'package:smart_watch_app/pages/attention.dart';
import 'package:smart_watch_app/pages/health.dart';
import 'package:smart_watch_app/pages/service.dart';
import 'package:smart_watch_app/pages/my.dart';
import 'package:smart_watch_app/pages/safe.dart';

class Navigation extends StatefulWidget {
  @override
  NavigationState createState() => new NavigationState();
}

// SingleTickerProviderStateMixin is used for animation
class NavigationState extends State<Navigation> with SingleTickerProviderStateMixin {
  // Create a tab controller
  int _currentIndex = 0;
  TabController controller;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(initialIndex: _currentIndex, length: 5, vsync: this);

    onChanged = () {
      setState(() {
        _currentIndex = this.controller.index;  
      });
    };

    controller.addListener(onChanged);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[new Attention(), new Service(), new Health(), new Safe(), new My()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        child: new Container(
          height: ScreenUtil.getInstance().setHeight(118),
          child: new TabBar(
            indicatorColor: Colors.transparent,    // 下划线颜色
            indicatorWeight: 0.1,                  // 下划线大小
            tabs: <IconTab>[
              new IconTab(
                icon: _currentIndex == 0 ? 'bottom-attention-selected.png' : 'bottom-attention-default.png',
                text: '关注',
                color: _currentIndex == 0 ? Color(0xff03C4C9) : Color(0xffcccccc)
              ),
              new IconTab(
                icon: _currentIndex == 1 ? 'bottom-service-selected.png' : 'bottom-service-default.png',
                text: '服务',
                color: _currentIndex == 1 ? Color(0xff03C4C9) : Color(0xffcccccc)
              ),
              new IconTab(
                icon: _currentIndex == 2 ? 'bottom-health-selected.png' : 'bottom-health-default.png',
                text: '健康',
                color: _currentIndex == 2 ? Color(0xff03C4C9) : Color(0xffcccccc)
              ),
              new IconTab(
                icon: _currentIndex == 3 ? 'bottom-security-selected.png' : 'bottom-security-default.png',
                text: '安全',
                color: _currentIndex == 3 ? Color(0xff03C4C9) : Color(0xffcccccc)
              ),
              new IconTab(
                icon: _currentIndex == 4 ? 'bottom-my-selected.png' : 'bottom-my-default.png',
                text: '我的',
                color: _currentIndex == 4 ? Color(0xff03C4C9) : Color(0xffcccccc)
              ),
            ],
            // setup the controller
            controller: controller,
          ),
          decoration: BoxDecoration(            // 阴影
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow (
                color: const Color(0x80000000),
                offset: Offset(0.0, 6.0),
                blurRadius: 20.0,
              ),
            ], 
          ),
        )  
      ),
    );
  }
}