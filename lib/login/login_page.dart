import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';

// 登录界面
class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {

  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _isClick = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听输入改变
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'login',
      home: new Scaffold(

      ),
    );
  }

  void _verify() {
  }
}