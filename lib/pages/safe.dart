import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amap_base/amap_base.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 * 高德地图插件：https://github.com/OpenFlutter/amap_base_flutter.git
 * 更多功能可参照插件demo
 * 由于没有苹果测试机,目前只仅安卓手机可以看效果
 *  */
class Safe extends StatefulWidget {

  @override
  SafeState createState() => SafeState();
}

class SafeState extends State<Safe> {
  AMapController _controller;

  // 功能按钮
  Widget _iconButton({ String icon, String title, String link, bool phone = false }) {
    return SizedBox(
      width:ScreenUtil.getInstance().setWidth(190),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Image.asset(
              icon,
              width: ScreenUtil.getInstance().setWidth(70),
              height: ScreenUtil.getInstance().setWidth(70),
            ),
            Text(title)
          ],
        ),
        onPressed: () {
          
          if (phone) {
            launch("tel:123456789");          // 调起手机通话
          }else { 
            showDialog(
              context: context,
              child: new AlertDialog(
                content: new Text("功能待开发..."),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('确定'))
                ],
              )
            );
          }
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: <Widget>[
          GradientAppBar(title: '安全'),

          Expanded(
            child: AMapView(
              onAMapViewCreated: (controller) {
                setState(() {
                  _controller = controller;
                });
              },
              amapOptions: AMapOptions(
                compassEnabled: false,
                zoomControlsEnabled: true,
                camera: CameraPosition(
                  target: LatLng(22.545999, 113.941133),
                  zoom: 15,
                ),
              ),
            ),
            // child: Container(
            //   child: Text('这是地图文字'),
            // ),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil.getInstance().setWidth(30),
              vertical: ScreenUtil.getInstance().setHeight(5)
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30)),
              width: ScreenUtil.getInstance().setWidth(690),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                  const Radius.circular(8.0),
                ), 
                border: Border.all(width: 1.0)
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: ScreenUtil.getInstance().setHeight(25),
                children: <Widget>[
                  _iconButton(
                    icon: 'assets/images/security-3.png',
                    title: '活动轨迹',
                    link: '/new page'
                  ),
                  _iconButton(
                    icon: 'assets/images/security-4.png',
                    title: '智能围栏',
                    link: '/new page'
                  ),
                  _iconButton(
                    icon: 'assets/images/security-5.png',
                    title: '定位',
                    link: '/new page'
                  ),
                  _iconButton(
                    icon: 'assets/images/security-6.png',
                    title: '重启设备',
                    link: '/new page'
                  ),
                  _iconButton(
                    icon: 'assets/images/security-7.png',
                    title: '消息',
                    link: '/new page'
                  ),
                  _iconButton(
                    icon: 'assets/images/security-8.png',
                    title: '通话',
                    link: '/new page',
                    phone: true
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
