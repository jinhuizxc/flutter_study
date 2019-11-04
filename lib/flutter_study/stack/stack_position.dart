import 'package:flutter/material.dart';

/*
 * Stack test;
 *
 * Flutter页面布局 Stack层叠组件 Stack与Align Stack与Positioned实现定位布局
 * https://www.cnblogs.com/yiweiyihang/p/11451966.html
 *
 * Stack与Positioned
 *
 */
class StackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack层叠组件->Positioned'),
        ),
        body: HomeContent(),
      );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Stack结合align实现布局：
    return Center(
      child: Container(
        width: 300.0,
        height: 400.0,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            // 右上角 Positioned相对于层叠组件的距离
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.home, color: Colors.white,size: 40),
            ),
            // 左上角
            Positioned(
              top: 10,
              left: 10,
              child: Icon(Icons.search, color: Colors.white,size: 40),
            ),
            // 右下角
            Positioned(
              bottom: 10,
              right: 20,
              child: Icon(Icons.select_all, color: Colors.white,size: 40),
            ),
          ],

        ),
      ),
    );
  }
}