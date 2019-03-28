import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:smart_watch_app/common/widget/icon_text.dart';
import 'package:smart_watch_app/widgets/charts.dart';

class Health extends StatefulWidget {
  
  @override
  HealthState createState() => new HealthState();
}

class HealthState extends State<Health> {

  // 实时数据按钮
  Widget _dataItem({String icon, String title, String count = "暂无数据", String date = "- -", String link}) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)),
        width: ScreenUtil.getInstance().setWidth(345),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(10)),
              child: Image.asset(icon, 
                width: ScreenUtil.getInstance().setWidth(85),
                height:ScreenUtil.getInstance().setWidth(85)
              ),
            ),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title),
                      Text(count)
                    ],
                  ),

                  Text(date, style:TextStyle(color: Color(0xffCCCCCC)))
                ],
            ))
            
          ]
        ),
      ),
      onPressed: () {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: new Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          children: <Widget>[
            GradientAppBar(title: '爸爸',),

            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                ScreenUtil.getInstance().setWidth(30), 
                ScreenUtil.getInstance().setHeight(50), 
                ScreenUtil.getInstance().setWidth(30), 
                ScreenUtil.getInstance().setHeight(30)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconText(
                        icon: 'assets/images/male.png',
                        iconWidth: 30,
                        iconHeight: 35,
                        title: '爸爸',
                      )],
                  ),

                  Row(
                    children: <Widget>[

                      // 图表
                      Container(
                        padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40)),
                        width: ScreenUtil.getInstance().setWidth(460),
                        height: ScreenUtil.getInstance().setHeight(320),
                        child: PieOutsideLabelChart(
                          _createSampleData(),
                        )
                      ),
                      
                      // 列表
                      Container(
                        width: ScreenUtil.getInstance().setWidth(230),
                        height: ScreenUtil.getInstance().setHeight(320),
                        child: ListView(
                          children: <Widget>[
                            IconText(
                              icon: 'assets/images/health-2.png',
                              iconWidth: 22,
                              iconHeight: 40,
                              title: '健   康：35天',
                              bottomPadding: 20,
                            ),
                            IconText(
                              icon: 'assets/images/health-1.png',
                              iconWidth: 22,
                              iconHeight: 40,
                              title: '亚健康：10天',
                              bottomPadding: 20,
                            ),
                            IconText(
                              icon: 'assets/images/health-3.png',
                              iconWidth: 22,
                              iconHeight: 30,
                              title: '疾   病：0天',
                              bottomPadding: 20,
                            ),
                            IconText(
                              icon: 'assets/images/health-4.png',
                              iconWidth: 22,
                              iconHeight: 40,
                              title: '未佩戴：10天',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
              
            ),

            // 今日实时数据
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20)),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  ScreenUtil.getInstance().setWidth(30),
                  0,ScreenUtil.getInstance().setWidth(30),
                  ScreenUtil.getInstance().setWidth(20),
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('今日实时数据'),

                        FlatButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Text('查看趋势 >'),
                          onPressed: () {
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
                          },
                        )
                      ],
                    ),

                    Wrap(
                      children: <Widget>[
                        _dataItem(
                          icon: 'assets/images/health-5.png',
                          title: '心率', 
                          date: '16:42',
                          link: '/new Page'
                        ),
                        _dataItem(
                          icon: 'assets/images/health-6.png',
                          title: '血压', 
                          date: '16:42',
                          link: '/new Page'
                        ),
                        Divider(height: 25.0,),
                        _dataItem(
                          icon: 'assets/images/health-7.png',
                          title: '血氧', 
                          link: '/new Page'
                        ),
                        _dataItem(
                          icon: 'assets/images/health-8.png',
                          title: '血糖', 
                          link: '/new Page'
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
            
          ],
        ),
      )
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales('健康', 35),
      new LinearSales('亚健康', 15),
      new LinearSales('疾病', 0),
      new LinearSales('未佩戴', 10),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.sales,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}',
      )
    ];
  }
}
