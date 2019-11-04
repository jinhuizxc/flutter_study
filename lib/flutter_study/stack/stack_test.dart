import 'package:flutter/material.dart';

/*
 * Stack test;
 *
 * Flutter页面布局 Stack层叠组件 Stack与Align Stack与Positioned实现定位布局
 * https://www.cnblogs.com/yiweiyihang/p/11451966.html
 *
 */
class StackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack例子'),
      ),
      body: StackSample(),
    );
  }
}

Widget StackSample() {
  return new Column(
    children: <Widget>[
      // 设置高度为20的盒子
      new SizedBox(
        height: 20.0,
//        child: Container(
//          color: Colors.red,
//        ),
      ),
      // 创建第一个Stack
      new Stack(
        alignment: const FractionalOffset(0.9, 0.1), //方法一
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/illustration_11.jpg"),
            width: 300.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
      new SizedBox(height: 10.0),
      // 创建第二个Stack
      new Stack(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/illustration_11.jpg"),
            width: 300.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          // 添加一个Positioned组件
          new Positioned(
            //方法二
            right: 15.0,
            top: 15.0,
            child: new Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      )
    ],
  );
}
