import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_watch_app/common/widget/input_visible.dart';
import 'package:smart_watch_app/common/config/validate.dart';
import 'package:smart_watch_app/common/widget/form/custom_input.dart';
import 'package:smart_watch_app/common/widget/form/submit_button.dart';

class RenderModifyPassword extends StatefulWidget {
  
  @override
  RenderModifyPasswordState createState() => RenderModifyPasswordState();
}

class RenderModifyPasswordState extends State<RenderModifyPassword> {
  GlobalKey _formKey= new GlobalKey<FormState>();
  String _phoneNum;                           // 手机号码
  String _oldPassword;                        // 原始密码
  String _newPassword;                        // 新密码
  String _confirmPassword;                    // 确认输入密码  

  // 获取焦点输出框可见部分
  FocusNode _focusNodePhoneNum = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  // 登录
  void submit() {
    (_formKey.currentState as FormState).save();
                    
    if (!Validate.password.hasMatch(_newPassword)) {
      Fluttertoast.showToast(msg: "密码长度为8到20位");
      return;
    }else if (_newPassword != _confirmPassword) {
      Fluttertoast.showToast(msg: "前后两次密码不相同");
      return;
    }else if (_newPassword ==_oldPassword) {
      Fluttertoast.showToast(msg: '新旧密码不能一致');
      return;
    }
    
    Fluttertoast.showToast(msg: "修改成功");
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
            // 原始密码输入框
            new EnsureVisibleWhenFocused(
              focusNode: _focusNodePassword,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(90),
                child: CustomInput(
                  hintText: '请输入原始密码',
                  type: 'password',
                  icon: Icon(Icons.lock_outline),
                  onSaveCallback: (value) => _oldPassword = value,
                  isShowSuffixIcon: false,
                )
              )
            ),

            // 密码输入框
            new EnsureVisibleWhenFocused(
              focusNode: _focusNodePassword,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                child: SizedBox(
                  height: ScreenUtil.getInstance().setHeight(90),
                  child: CustomInput(
                    hintText: '请输入新密码',
                    type: 'password',
                    icon: Icon(Icons.lock),
                    onSaveCallback: (value) => _newPassword = value,
                  )
                )
              )
            ),

            // 密码输入框
            new EnsureVisibleWhenFocused(
              focusNode: _focusNodePassword,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                child: SizedBox(
                  height: ScreenUtil.getInstance().setHeight(90),
                  child: CustomInput(
                    hintText: '请确认新密码',
                    type: 'password',
                    icon: Icon(Icons.lock),
                    onSaveCallback: (value) => _confirmPassword = value,
                  )
                )
              )
            ),
            
            // 修改密码
            Container(
              width: ScreenUtil.getInstance().setWidth(520),
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(50)),
              child: SubmitButton(
                title: '修改密码',
                callback: submit
              )
            )
          ]
        ),
      )
    );
  }
}