import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_watch_app/common/widget/input_visible.dart';
import 'package:smart_watch_app/common/config/validate.dart';
import 'package:smart_watch_app/common/widget/form/custom_input.dart';
import 'package:smart_watch_app/common/widget/form/submit_button.dart';

class RenderLogin extends StatefulWidget {
  
  @override
  RenderLoginState createState() => RenderLoginState();
}

class RenderLoginState extends State<RenderLogin> {
  GlobalKey _formKey= new GlobalKey<FormState>();
  String _phoneNum;                           // 手机号码
  String _password;                           // 密码

  // 获取焦点输出框可见部分
  FocusNode _focusNodePhoneNum = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  // 登录
  void submit() {
    (_formKey.currentState as FormState).save();
                    
    if (!Validate.phoneNum.hasMatch(_phoneNum)) {
      Fluttertoast.showToast(msg: "请输入正确的手机号码");
      return;
    }else if (!(_password.length > 7 && _password.length < 21)) {
      Fluttertoast.showToast(msg: "密码长度为8到20位");
      return;
    }
    print(_phoneNum+_password);
    Fluttertoast.showToast(msg: "登录成功");
    // Navigator.of(context).pop();        // 返回上一层
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(608),
      child: Form(
        key: _formKey,           //设置globalKey，用于后面获取FormState
        autovalidate: true, 
        child: Column(
          children: <Widget>[    
            EnsureVisibleWhenFocused(
              focusNode: _focusNodePhoneNum,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(90),
                child: CustomInput(
                  hintText: '请输入手机号码',
                  type: 'number',
                  autoFocus: true,
                  icon: Icon(Icons.phone_iphone),
                  onSaveCallback: (value) => _phoneNum = value,
                ),
              ),
            ),

            // 密码输入框
            new EnsureVisibleWhenFocused(
              focusNode: _focusNodePassword,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                child: SizedBox(
                  height: ScreenUtil.getInstance().setHeight(90),
                  child: CustomInput(
                    hintText: '请输入密码',
                    type: 'password',
                    icon: Icon(Icons.lock),
                    onSaveCallback: (value) => _password = value,
                  )
                )
              )
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text('忘记密码？'),
                  onPressed: () {

                  },
                )
              ],
            ),

            // 登录按钮
            Container(
              width: ScreenUtil.getInstance().setWidth(520),
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
              child: SubmitButton(
                title: '登录',
                callback: submit
              )
            )
          ]
        ),
      )
    );
  }
}