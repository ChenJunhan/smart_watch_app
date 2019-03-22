import 'package:flutter/material.dart';
import 'package:smart_watch_app/common/widget/gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_watch_app/common/widget/form/custom_input.dart';

class BindDevice extends StatefulWidget {
  @override
  BindDeviceState createState() => BindDeviceState();
}

class BindDeviceState extends State<BindDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientAppBar(
              title: '绑定设备',
              showBefore: true,
            ),

            Padding(
              padding: EdgeInsets.all(ScreenUtil.getInstance().setHeight(30)),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().setHeight(75),
                  horizontal: ScreenUtil.getInstance().setWidth(60)
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(const Radius.circular(5.0),)
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(20)),
                          child: Text('设备昵称'),
                        ),
                        
                        Container(
                          width: ScreenUtil.getInstance().setWidth(448),
                          height: ScreenUtil.getInstance().setHeight(65),
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil.getInstance().setWidth(20)
                          ),
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.black, width: 1.0),
                            borderRadius: new BorderRadius.circular(5.0)
                          ),
                          child: TextField(
                            decoration: InputDecoration.collapsed(),
                          ),
                        )
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(448),
                            height: ScreenUtil.getInstance().setHeight(65),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '请输入15位序列号',
                                focusedBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: Colors.black),   
                                ),    
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
                            child: SizedBox(
                              width: ScreenUtil.getInstance().setWidth(60),
                              height: ScreenUtil.getInstance().setWidth(60),
                              child: FlatButton(
                              padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/scan.png',
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                  print(123);
                                },
                              )
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}