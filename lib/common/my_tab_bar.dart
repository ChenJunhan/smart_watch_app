import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/tab_flat_button.dart'; 
import 'package:smart_watch_app/common/model/my_tab_controller.dart';
import 'package:smart_watch_app/common/my_tab_bar_view.dart';
import 'package:smart_watch_app/common/tab_controller.dart';

export 'package:smart_watch_app/common/model/my_tab_controller.dart';
export 'package:smart_watch_app/common/tab_flat_button.dart'; 
export 'package:smart_watch_app/common/my_tab_bar_view.dart';

class MyTabBar extends StatefulWidget {
  MyTabController controller;
  // List<Widget> tabs;

  MyTabBar({
    Key key,
    @required this.controller,
    // @required this.tabs,
  });

  @override
  MyTabBarState createState() => new MyTabBarState();
}

class MyTabBarState extends State<MyTabBar> {
  bool loginActive = true;
  bool registryActive = false;
  // List<type> tabList = new List();

  @override
  void initState() {
    super.initState();
  }

  _onChanged(index) {
    eventBus.fire(new MyEvent(index));

    setState(() {
      widget.controller.activeIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: <Widget>[
        TabFlatButton(title: '登录', isActive: widget.controller.activeIndex == 0, callBack: () => _onChanged(0),),
        TabFlatButton(title: '注册', isActive: widget.controller.activeIndex == 1, callBack: () => _onChanged(1),)
      ]
    );
  }
}



