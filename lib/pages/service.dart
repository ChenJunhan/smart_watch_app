import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smart_watch_app/pages/article_list.dart';
import 'package:smart_watch_app/route_animates/slide_route.dart';

class Service extends StatefulWidget {
  @override
  ServiceState createState() => new ServiceState();
}

class ServiceState extends State<Service> {
  SwiperController _controller;

  @override
  void initState() {
    super.initState();

    setState(() {
      _controller = new SwiperController();
    });
  }

  @override
  Widget build(BuildContext context) {

    var bannerList = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
      'assets/images/banner4.jpg'
    ];

    Widget _wrapItem(src, title, index) {
      return FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            Container( 
              width: ScreenUtil.getInstance().setWidth(350),
              height: ScreenUtil.getInstance().setHeight(220),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(src, fit: BoxFit.cover),
              ),
            ),

            Positioned(
              top: ScreenUtil.getInstance().setHeight(20),
              right: ScreenUtil.getInstance().setWidth(18),
              child: Text(title, style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30))),
            )   
          ]
        ),
        onPressed: () {
          // 跳转到绑定设备页面
          Navigator.push( context,
            SlideRoute(builder: (context) {
                  return ArticleList();
              }));
        },
      );

    }

    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: <Widget>[
          // 轮播
          Container(
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(400),
            child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    bannerList[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 4,
                autoplay: true,
                controller: _controller,
                pagination: new SwiperPagination(
                  margin: new EdgeInsets.all(5.0),
                  builder: DotSwiperPaginationBuilder(
                    color: Color(0xFF999999),
                    activeColor: Color(0xFF1AC8CB),
                  )
                ),
              ),
          ),
          
          Container(
            color: Color(0xFFFFFFFF),
            width: ScreenUtil.getInstance().setWidth(750),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(15)),
            child: Wrap(
              spacing: ScreenUtil.getInstance().setWidth(15), // 主轴(水平)方向间距
              runSpacing: ScreenUtil.getInstance().setWidth(15), // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                _wrapItem('assets/images/type4.png', '养生保健', 1),
                _wrapItem('assets/images/type3.png', '疾病预防', 2),
                _wrapItem('assets/images/type1.png', '操作指南', 3),
                _wrapItem('assets/images/type2.png', '大家健康', 4),
              ],
            )
          )
        ],     
      )
    );
  }
}