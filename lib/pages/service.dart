import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Service extends StatefulWidget {
  @override
  ServiceState createState() => new ServiceState();
}

class ServiceState extends State<Service> {
  SwiperController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new SwiperController();
  }


  @override
  Widget build(BuildContext context) {

    var bannerList = [
      'http://app.anyhao.cn/static/banner/banner1.jpg',
      'http://app.anyhao.cn/static/banner/banner2.jpg',
      'http://app.anyhao.cn/static/banner/banner3.jpg',
      'http://app.anyhao.cn/static/banner/banner4.jpg'
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
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: new Image.network(src, fit: BoxFit.cover),
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
          showDialog(
            context: context,
            child: new AlertDialog(
              content: new Text("我是AlertDialog"),
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

    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: <Widget>[
          // 轮播
          // new ConstrainedBox(
          //   child: new Swiper(
          //       itemBuilder: (BuildContext context, int index) {
          //         return new Image.network(
          //           bannerList[index],
          //           fit: BoxFit.fill,
          //         );
          //       },
          //       itemCount: 4,
          //       autoplay: true,
          //       controller: _controller,
          //       pagination: new SwiperPagination(
          //         margin: new EdgeInsets.all(5.0),
          //         builder: DotSwiperPaginationBuilder(
          //           color: Color(0xFF999999),
          //           activeColor: Color(0xFF1AC8CB),
          //         )
          //       ),
          //     ),
          //     constraints: new BoxConstraints.loose(new Size(ScreenUtil.getInstance().setWidth(750), ScreenUtil.getInstance().setHeight(400)))
          // ),
          
          Container(
            color: Color(0xFFFFFFFF),
            width: ScreenUtil.getInstance().setWidth(750),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(15)),
            child: Wrap(
              spacing: ScreenUtil.getInstance().setWidth(15), // 主轴(水平)方向间距
              runSpacing: ScreenUtil.getInstance().setWidth(15), // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                _wrapItem('http://api.dengtmac.top:8989/static/service/type4.png', '养生保健', 1),
                _wrapItem('http://api.dengtmac.top:8989/static/service/type3.png', '疾病预防', 2),
                _wrapItem('http://api.dengtmac.top:8989/static/service/type1.png', '操作指南', 3),
                _wrapItem('http://api.dengtmac.top:8989/static/service/type2.png', '大家健康', 4),
              ],
            )
          )
        ],     
      )
    );
  }
}