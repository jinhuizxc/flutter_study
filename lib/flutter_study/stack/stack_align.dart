import 'package:flutter/material.dart';

/*
 * Stack test;
 *
 * Flutter页面布局 Stack层叠组件 Stack与Align Stack与Positioned实现定位布局
 * https://www.cnblogs.com/yiweiyihang/p/11451966.html
 *
 * Stack与Align
 *
 * 但是这种显示方式位置单一不能很好的设置距离吧
 *
 */
class StackAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack层叠组件->Align'),
        ),
        body: HomeContent(),
      );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Stack结合align实现布局：
    return Container(
        // 不指定宽高的话布局充满整个页面
        width: 300.0,
        height: 400.0,
        color: Colors.red,
        // Stack
        child: Stack(
          children: <Widget>[
            // 左上角
            Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.home, color: Colors.white,size: 40),
            ),
            // 中间上方
            Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.search, color: Colors.white,size: 40),
            ),
            // 居中
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.laptop_chromebook, color: Colors.white,size: 40),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.home, color: Colors.white,size: 40),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.enhanced_encryption, color: Colors.white,size: 40),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(Icons.open_with, color: Colors.blue,size: 40),
            ),
            // 右下角
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.select_all, color: Colors.yellow,size: 40),
            ),
          ],
        ),
      );

  }
}
