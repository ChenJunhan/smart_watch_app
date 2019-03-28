import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:smart_watch_app/pages/article.dart';
import 'package:smart_watch_app/route_animates/slide_route.dart';

class ArticleList extends StatefulWidget {
  @override
  ArticleListState createState() => ArticleListState();
}

class ArticleListState extends State<ArticleList> {

  Widget _item() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil.getInstance().setHeight(30),
        horizontal: ScreenUtil.getInstance().setWidth(20)
      ),
      color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
            'assets/images/health-nobind.jpg',
              width: ScreenUtil.getInstance().setWidth(250),
              height: ScreenUtil.getInstance().setHeight(160),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().setHeight(8)
                ),
                height: ScreenUtil.getInstance().setHeight(160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '为什么不吃早餐会增加心脏病触发',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil.getInstance().setSp(28)
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('2019-03-19'),
                  ],
                ),
              )
            )
          ],
        ),
        onPressed: () {
          // 跳转到绑定设备页面
          Navigator.push( context,
            new SlideRoute(builder: (context) {
                  return Article();
              }));
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) { 
    //获取系统状态栏高度跟屏幕高度
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Container(
        width: ScreenUtil.getInstance().setWidth(750),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,      // 纵轴对齐方式
          children: <Widget>[
            GradientAppBar(
              title: '疾病预防',
              showBefore: true,
            ),

            Container(
              height: screenHeight - statusBarHeight - ScreenUtil.getInstance().setHeight(70),
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column( 
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(20),
                        ),
                        child: _item(),
                      ),
                    ]
                  ),
                ),
              )
            )
            
          ],
        )
      ),
    );
  }
}