/*
 * @Author: ChenJunhan 
 * @Date: 2019-03-20 16:23:54 
 * @Last Modified by: ChenJunhan
 * @Last Modified time: 2019-03-20 17:38:48
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class CustomInput extends StatefulWidget {
  String hintText;                      // 提示文字
  String type;                          // 输入框类型：nubmer/password
  bool autoFocus;                       // 自动获取焦点
  Widget icon;
  Function onSaveCallback;              // 保存回调函数
  bool isVerCode;                       // 是否显示发送验证码按钮

  CustomInput({
    Key key,
    @required this.hintText,
    @required this.type,
    this.autoFocus = false,
    this.icon,
    this.onSaveCallback,
    this.isVerCode = false
  })
    : assert(hintText != null || type != null),
      super(key: key);
  
  @override
  CustomInputState createState() => CustomInputState();
}

class CustomInputState extends State<CustomInput> {
  bool _obscureText = true;                   // 是否隐藏文本
  IconData _pwIcon = Icons.visibility;        // 密码输入框图标
  String _verCodeText = '发送验证码'; 
  bool _isSendCode = true;                     // 发送验证码按钮点击是否有效
  int _count = 60;
  
  Widget _suffixIcon(String type) {
    if (type == 'password') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: IconButton(
          icon: Icon(_pwIcon, color: Color(0xff878787)),
          onPressed: () {
            // 显示/隐藏密码
            setState(() {
              _obscureText = !_obscureText;
              _pwIcon = _obscureText ? Icons.visibility : Icons.visibility_off;
            });
          },
        ),
      );
    } else if (widget.isVerCode) {
      return SizedBox(
        width: ScreenUtil.getInstance().setWidth(208),
        height: ScreenUtil.getInstance().setHeight(90),
        child: RaisedButton(
          elevation: 0.0,                 // 阴影
          highlightElevation: 0.0,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
          )),
          child: Text(_verCodeText),
          onPressed: _isSendCode ? () {
            _isSendCode = false;
            setState(() => _verCodeText = '${_count}秒');
            
            // 设置验证码定时器
            var _duration = new Duration(seconds: 1);
            new Timer.periodic(_duration, (Timer t) {
              _count--;
              if (_count == 0) { 
                _count = 60;
                setState(() { 
                  _verCodeText = '重新发送';
                  _isSendCode = true;
                });
                t.cancel();
                return;
              }
              setState(() => _verCodeText = '${_count}秒');
            });
          } : null,
        ),
      );
    }else return null;
  }

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      autofocus: widget.autoFocus,
      keyboardType: widget.type == 'number' ? TextInputType.numberWithOptions() : null,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: ScreenUtil.getInstance().setHeight(0),
          horizontal: widget.icon == null ? ScreenUtil.getInstance().setHeight(40) : 0
        ),
        fillColor: Color(0xFFF5F5F5),
        hintText: widget.hintText,
        prefixIcon: widget.icon != null ? Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(35)),
          child: widget.icon,
        ): null,
        suffixIcon: _suffixIcon(widget.type),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none
        ),
      ),
      onSaved: widget.onSaveCallback,
      obscureText: widget.type == 'password' ? _obscureText : false  
    );
  }
}