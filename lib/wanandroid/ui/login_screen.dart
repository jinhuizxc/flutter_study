import 'package:flutter/material.dart';

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
                    child: Text(
                      "用户登录",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    child: Text(
                      "请使用WanAndroid账号登录",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2)),
                  Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2)),
                  // 登录按钮
                  Padding(padding: EdgeInsets.only(top: 28.0)),
                  // 注册按钮
                  Container(
                    padding: EdgeInsets.only(top: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
