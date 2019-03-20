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

  // 获取焦点输出框可见部分
  FocusNode _focusNodePhoneNum = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  bool _obscureText = true;                   // 是否隐藏文本
  IconData _pwIcon = Icons.visibility;        // 密码输入框图标
  String _phoneNum;                           // 手机号码
  String _password;                           // 密码

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
            // 手机号码输入框
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
            //           padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(35)),
            //           child: Icon(Icons.phone_iphone),
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
            
            EnsureVisibleWhenFocused(
              focusNode: _focusNodePhoneNum,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(90),
                child: CustomInput(
                  hintText: '请输入手机号码',
                  type: 'number',
                  autoFocus: true,
                  icon: Icon(Icons.phone_iphone),
                  // controller: _phoneNumController,
                  // focusNode: _focusNodePhoneNum,
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
                    // controller: _passwordController,
                    // focusNode: _focusNodePassword,
                    onSaveCallback: (value) => _password = value,
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
            //           contentPadding: EdgeInsets.symmetric(vertical: 0.0),
            //           fillColor: Color(0xFFF5F5F5),
            //           hintText: "请输入密码",
            //           prefixIcon: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(35)),
            //             child: Icon(Icons.lock),
            //           ),
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