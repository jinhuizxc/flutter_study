import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/routers/application.dart';
import 'package:flutter_study/routers/routers.dart';
import 'package:flutter_study/sample/flutter_study_app/common/Constant.dart'
    as prefix0;
import 'package:flutter_study/sample/flutter_study_app/common/Constant.dart';

/*
 * 项目主页
 */
class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with SingleTickerProviderStateMixin {
  // 可见
  var _visible = true;

  // AnimationController 继承自Animation<double>
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // vsync: this 需要with这个SingleTickerProviderStateMixin
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));

    // 设置动画方式 curve: Curves.easeOut
    _animation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeOut);

    // 添加动画监听, 回调函数方式(){}
    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();

//    setState(() {
//      _visible = !_visible;
//    });

    // 倒计时3s进入首页
    goHome();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand, // 占满整个屏幕
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'Flutter Lover',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // cat.jpeg
              new Image.asset(
               /* 'assets/images/logo-github.png',*/
                'assets/images/cat.jpeg',
                width: _animation.value * 300,
                height: _animation.value * 300,
              )
            ],
          )
        ],
      ),
    );
  }


  goHome() async{
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, toHome);
  }

  void toHome() {
//    Navigator.of(context).pushReplacementNamed(Constant.HOME_PAGE);
    // 路由跳转, 路由跳转方式: TransitionType.inFromRight
    Application.router.navigateTo(context, RoutesConstant.homePage,
        replace: true, transition: TransitionType.inFromRight);
  }
}
