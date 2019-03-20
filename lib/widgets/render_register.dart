import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_watch_app/common/widget/input_visible.dart';
import 'package:smart_watch_app/common/config/validate.dart';
import 'package:smart_watch_app/common/widget/form/custom_input.dart';
import 'package:smart_watch_app/common/widget/form/submit_button.dart';

class RenderRegister extends StatefulWidget {
  
  @override
  RenderRegisterState createState() => RenderRegisterState();
}

class RenderRegisterState extends State<RenderRegister> {
  GlobalKey _formKey= new GlobalKey<FormState>();

  // 获取焦点输出框可见部分
  FocusNode _focusNodePhoneNum = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();
  FocusNode _focusNodeVerCode = new FocusNode();

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
                  // controller: _phoneNumController,
                  // focusNode: _focusNodePhoneNum,
                  onSaveCallback: (value) => _phoneNum = value,
                ),
              ),
            ),
            
            // new EnsureVisibleWhenFocused(
            //   focusNode: _focusNodePhoneNum,
            //   child: SizedBox(
            //     height: ScreenUtil.getInstance().setHeight(90),
            //     child: TextFormField(
            //       autofocus: true,
            //       decoration: InputDecoration(
            //         filled: true,
            //         contentPadding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(0)),
            //         fillColor: Color(0xFFF5F5F5),
            //         hintText: "请输入手机号码",
            //         prefixIcon: Padding(
            //           padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(40), right: ScreenUtil.getInstance().setWidth(20)),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: <Widget>[
            //               Text('+86', style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(28)),),
            //               Icon(Icons.keyboard_arrow_down, color: Color(0xffB4B4B4),)
            //             ],
            //           ),
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(50),
            //           borderSide: BorderSide.none
            //         ),
            //       ),
            //       focusNode: _focusNodePhoneNum,
            //       controller: _phoneNumController,
            //       onSaved: (value) => _phoneNum = value           // 保存值
            //     ),
            //   )
            // ),
            
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
                    // controller: _passwordController,
                    // focusNode: _focusNodePassword,
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
                    // controller: _passwordController,
                    // focusNode: _focusNodePassword,
                    onSaveCallback: (value) => _verCode = value,
                    isVerCode: true,
                  )
                )
              )
            ),

            // 密码输入框
            // new EnsureVisibleWhenFocused(
            //   focusNode: _focusNodePassword,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
            //     child: SizedBox(
            //       height: ScreenUtil.getInstance().setHeight(90),
            //       child: TextFormField(
            //         autofocus: true,
            //         decoration: InputDecoration(
            //           filled: true,
            //           contentPadding: EdgeInsets.symmetric(
            //             horizontal: ScreenUtil.getInstance().setHeight(40), 
            //           ),
            //           fillColor: Color(0xFFF5F5F5),
            //           hintText: "请输入8位以上密码",
            //           suffixIcon: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 0),
            //             child: IconButton(
            //               icon: Icon(_pwIcon, color: Color(0xff878787)),
            //               onPressed: () {
            //                 // 显示/隐藏密码
            //                 setState(() {
            //                   _obscureText = !_obscureText;
            //                   _pwIcon = _obscureText ? Icons.visibility : Icons.visibility_off;
            //                 });
            //               },
            //             ),
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(50),
            //             borderSide: BorderSide.none
            //           ),
            //         ),
            //         focusNode: _focusNodePassword,
            //         controller: _passwordController,
            //         onSaved: (value) => _password = value, 
            //         obscureText: _obscureText
            //       ),
            //     )
            //   )
            // ),

            // // 验证码输入框
            // new EnsureVisibleWhenFocused(
            //   focusNode: _focusNodeVerCode,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
            //     child: SizedBox(
            //       height: ScreenUtil.getInstance().setHeight(90),
            //       child: TextFormField(
            //         autofocus: true,
            //         decoration: InputDecoration(
            //           filled: true,
            //           contentPadding: EdgeInsets.symmetric(
            //             horizontal: ScreenUtil.getInstance().setHeight(40), 
            //           ),
            //           fillColor: Color(0xFFF5F5F5),
            //           hintText: "请输入验证码",
            //           suffixIcon: SizedBox(
            //             width: ScreenUtil.getInstance().setWidth(208),
            //             height: ScreenUtil.getInstance().setHeight(90),
            //             child: RaisedButton(
            //               elevation: 0.0,                 // 阴影
            //               highlightElevation: 0.0,
            //               color: Theme.of(context).primaryColor,
            //               textColor: Colors.white,
            //               disabledTextColor: Colors.white,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(50),
            //                 bottomRight: Radius.circular(50)
            //               )),
            //               child: Text(_verCodeText),
            //               onPressed: _isSendCode ? () {
            //                 _isSendCode = false;
            //                 setState(() => _verCodeText = '${_count}秒');
                            
            //                 // 设置验证码定时器
            //                 var _duration = new Duration(seconds: 1);
            //                 new Timer.periodic(_duration, (Timer t) {
            //                   _count--;
            //                   if (_count == 0) { 
            //                     _count = 60;
            //                     setState(() { 
            //                       _verCodeText = '重新发送';
            //                       _isSendCode = true;
            //                     });
            //                     t.cancel();
            //                     return;
            //                   }
            //                   setState(() => _verCodeText = '${_count}秒');
            //                 });
            //               } : null,
            //             ),
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(50),
            //             borderSide: BorderSide.none
            //           ),
            //         ),
            //         focusNode: _focusNodeVerCode,
            //         controller: _verCodeController,
            //         onSaved: (value) => _verCode = value, 
            //         obscureText: _obscureText
            //       ),
            //     )
            //   )
            // ),

            // 注册按钮
            Container(
              width: ScreenUtil.getInstance().setWidth(520),
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(55)),
              child: SubmitButton(
                title: '注册',
                callback: submit,
              )
            )
          ]
        ),
      )
    );
  }
}