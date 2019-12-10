import 'package:flutter/material.dart';

/*
 * wanandroid App实战学习！
 */
/// 在拿不到context的地方通过navigatorKey进行路由跳转：
/// https://stackoverflow.com/questions/52962112/how-to-navigate-without-context-in-flutter-app
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class WanAndroidApp extends StatefulWidget {
  @override
  _WanAndroidAppState createState() => _WanAndroidAppState();
}

class _WanAndroidAppState extends State<WanAndroidApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wanandroid'),
      ),
      body: Container(
        child: Text('wandroid'),

      ),
    );
  }
}
