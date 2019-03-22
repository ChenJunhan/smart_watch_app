import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/my_tab_flat_button.dart'; 
import 'package:smart_watch_app/common/model/my_tab_controller.dart';
import 'package:smart_watch_app/common/widget/my_tab_bar_view.dart';
import 'package:smart_watch_app/common/eventBus/tab_controller.dart';

export 'package:smart_watch_app/common/model/my_tab_controller.dart';
export 'package:smart_watch_app/common/widget/my_tab_flat_button.dart'; 
export 'package:smart_watch_app/common/widget/my_tab_bar_view.dart';

class MyTabBar extends StatefulWidget {
  List<String> tab;
  MyTabController controller;

  MyTabBar({
    Key key,
    @required this.tab,
    @required this.controller,
  })
    : assert(tab != null || controller != null),
     super(key: key);

  @override
  MyTabBarState createState() => new MyTabBarState();
}

class MyTabBarState extends State<MyTabBar> {
  bool loginActive = true;
  bool registryActive = false;

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
      children: widget.tab.map((t) {
        return TabFlatButton(title: t, isActive: widget.controller.activeIndex == widget.tab.indexOf(t), callBack: () => _onChanged(widget.tab.indexOf(t)));
      }).toList()
    );
  }
}



