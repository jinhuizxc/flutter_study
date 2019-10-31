import 'package:flutter/material.dart';

/*
/*
 * 路由和导航
 * https://flutterchina.club/routing-and-navigation/
 */
 * Flutter学习笔记之路由简单实用
 * https://www.jianshu.com/p/ebb7c5288004
 *
 * Flutter 路由和导航
 * https://www.jianshu.com/p/3b105658728e
 *
 * 导航到一个新页面和返回
 * https://flutter.cn/docs/cookbook/navigation/navigation-basics
 */
class NavigatorTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FirstRoute();
  }
}

class FirstRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('导航到一个新页面和返回'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
      ),
    );
  }
}

// SecondRoute 第二个页面不用MaterialApp， 直接Scaffold，可以箭头返回
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go back!'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
