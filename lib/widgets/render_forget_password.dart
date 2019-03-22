import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_watch_app/common/widget/input_visible.dart';
import 'package:smart_watch_app/common/config/validate.dart';
import 'package:smart_watch_app/common/widget/form/custom_input.dart';
import 'package:smart_watch_app/common/widget/form/submit_button.dart';

class RenderForgetPassword extends StatefulWidget {
  
  @override
  RenderForgetPasswordState createState() => RenderForgetPasswordState();
}

class RenderForgetPasswordState extends State<RenderForgetPassword> {
  // 获取焦点输出框可见部分
  FocusNode _focusNodePhoneNum = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();
  FocusNode _focusNodeVerCode = new FocusNode();

  GlobalKey _formKey= new GlobalKey<FormState>();
  bool _obscureText = true;                   // 是否隐藏文本
  IconData _pwIcon = Icons.visibility;        // 密码输入框图标
  String _phoneNum;                           // 手机号码
  String _password;                           // 密码
  String _verCode;                            // 验证码                  
  String _verCodeText = '发送验证码'; 
  bool _isSendCode = true;                     // 发送验证码按钮点击是否有效

  // 注册
  void submit() {
    (_formKey.currentState as FormState).save();
        
    if (!Validate.phoneNum.hasMatch(_phoneNum)) {
      Fluttertoast.showToast(msg: "请输入正确的手机号码");
      return;
    }else if (!(_password.length > 7 && _password.length < 21)) {
      Fluttertoast.showToast(msg: "密码长度为8到20位");
      return;
    }

    Fluttertoast.showToast(msg: "注册成功");
    print("${_phoneNum}, ${_password}, ${_verCode}");
    Navigator.of(context).pop();         // 返回上一层
  }

  @override
  Widget build(BuildContext context) {
    int _count = 60;

    return Container(
      width: ScreenUtil.getInstance().setWidth(608),
      child: Form(
        key: _formKey,           //设置globalKey，用于后面获取FormState
        autovalidate: true, 
        child: Column(
          children: <Widget>[
            
            // 手机号码输入框
            EnsureVisibleWhenFocused(
              focusNode: _focusNodePhoneNum,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(90),
                child: CustomInput(
                  hintText: '请输入手机号码',
                  type: 'number',
                  autoFocus: true,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('+86', style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(28)),),
                      Icon(Icons.keyboard_arrow_down, color: Color(0xffB4B4B4),)
                    ],
                  ),
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
                    onSaveCallback: (value) => _password = value,
                  )
                )
              )
            ),

            // 验证码输入框
            new EnsureVisibleWhenFocused(
              focusNode: _focusNodeVerCode,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                child: SizedBox(
                  height: ScreenUtil.getInstance().setHeight(90),
                  child: CustomInput(
                    hintText: '请输入验证码',
                    type: 'number',
                    onSaveCallback: (value) => _verCode = value,
                    isVerCode: true,
                  )
                )
              )
            ),

            // 重置密码
            Container(
              width: ScreenUtil.getInstance().setWidth(520),
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(55)),
              child: SubmitButton(
                title: '重置密码',
                callback: submit,
              )
            )
          ]
        ),
      )
    );
  }
}