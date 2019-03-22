import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:smart_watch_app/common/widget/icon_item.dart';

class EquipmentInfomation extends StatefulWidget {

  @override
  EquipmentInfomationState createState() => new EquipmentInfomationState();
}

class EquipmentInfomationState extends State<EquipmentInfomation> {

  Widget _item(icon, text, link) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ConstrainedBox(
                child: Image.asset(icon),
                constraints: BoxConstraints.expand(
                  width: ScreenUtil.getInstance().setWidth(45),
                  height:ScreenUtil.getInstance().setWidth(45)
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0), child: Text(text, textAlign: TextAlign.start)),
            ],
          ),
          ConstrainedBox(
            child: Image.asset('assets/images/arr-1.png'),
            constraints: BoxConstraints.expand(
              width: ScreenUtil.getInstance().setWidth(14),
              height:ScreenUtil.getInstance().setWidth(30)
            ),
          ),
        ],
      ),
      onPressed: () {
        showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text("功能待开发"),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: ScreenUtil.getInstance().setWidth(750),
        color: Color(0xFFF5F5F5),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,      // 纵轴对齐方式
          children: <Widget>[

            // 标题
            GradientAppBar(
              title: '设备信息', 
              showBefore: true,
              customButton: FlatButton(
                padding: EdgeInsets.all(0),
                child: new Text(
                  '解除绑定',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(24)
                  )
                ),
                onPressed: () => print('解除绑定'),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(30), 0, ScreenUtil.getInstance().setHeight(40)),
              child: Column(
                children: <Widget>[
                  ConstrainedBox(
                    child: new Image.asset('assets/images/device-top.png',),
                    constraints: BoxConstraints.expand(
                      width: ScreenUtil.getInstance().setWidth(120),
                      height:ScreenUtil.getInstance().setWidth(120)
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20)),
                    child: Text(
                      '爸爸', 
                      style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30))
                    ),
                  ),
                  Text('设备号：359180754560267')
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(30)),
              color: Color(0xFFFFFFFF),
              child: Column(
                children: <Widget>[
                  IconItem(icon: 'assets/images/deviceInfo-2.jpg', text: '健康周报'),
                  Divider(height: 0),
                  IconItem(icon: 'assets/images/deviceInfo-3.jpg', text: '体检报告'),
                  Divider(height: 0),
                  IconItem(icon: 'assets/images/deviceInfo-4.jpg', text: '功能设置'),
                  Divider(height: 0),
                  IconItem(icon: 'assets/images/deviceInfo-5.jpg', text: '设备属性'),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}

