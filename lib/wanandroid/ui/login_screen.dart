import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/user_model.dart';
import 'package:flutter_study/wanandroid/event/login_event.dart';
import 'package:flutter_study/wanandroid/ui/register_screen.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/loading_dialog.dart';

/// 登录页面
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.4,
          title: Text('登录'),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "用户登录",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "请使用WanAndroid账号登录",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  // 用户名框
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                    child: TextField(
                      focusNode: _userNameFocusNode,
                      autofocus: false,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "请输入用户名",
                        labelStyle: TextStyle(color: Colors.cyan),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  // 密码框
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                    child: TextField(
                      focusNode: _passwordFocusNode,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        labelStyle: TextStyle(color: Colors.cyan),
                        hintText: "请输入密码",
                      ),
                      obscureText: true,
                      maxLines: 1,
                    ),
                  ),
                  // 登录按钮
                  Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                padding: EdgeInsets.all(16.0),
                                elevation: 0.5,
                                child: Text("登录"),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  String username = _userNameController.text;
                                  String password = _passwordController.text;
                                  _login(username, password);
                                }))
                      ],
                    ),
                  ),
                  // 注册按钮
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        registerClick();
                      },
                      child: Text(
                        '还没有账号，注册一个？',
                        style: TextStyle(
                            fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*
   * 注册后再登录的回调方法
   */
  Future registerClick() async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new RegisterScreen();
    })).then((value){
      var map = jsonDecode(value);
      var username = map['username'];
      var password = map['password'];
      _userNameController.text = username;
      _passwordController.text = password;
      _login(username, password);
    });
  }

  // 登录方法
  Future _login(String username, String password) async {
    if ((null != username && username.length > 0) &&
        (null != password && password.length > 0)) {
      _showLoading(context);
      apiService.login((UserModel model, Response response) {
        if (null != model) {
          if (model.errorCode == Constants.STATUS_SUCCESS) {
            _dismissLoading(context);
            User.singleton.saveUserInfo(model, response);
            Application.eventBus.fire(new LoginEvent());
            ToastUtil.show(msg: '登录成功');
            Navigator.of(context).pop();
          } else {
            ToastUtil.show(msg: model.errorMsg);
          }
        }
      }, (DioError error) {
        _dismissLoading(context);
        print(error.response);
      }, username, password);
    } else {
      ToastUtil.show(msg: '用户名或密码不能为空');
    }
  }

  /// 登录: 显示Loading
  void _showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new LoadingDialog(
            outsideDismiss: false,
            loadingText: '正在登录...',
          );
        });
  }

  /// 隐藏Loading
  void _dismissLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
