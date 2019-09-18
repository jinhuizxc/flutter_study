import 'package:flutter/material.dart';

/*
 * 手势检测
 */
class GestureDetectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '按下处理Demo',
      home: new MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('按下处理Demo'),
      ),
      body: Center(
        child: new MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //一定要把被触摸的组件放在GestureDetector里面
    return new GestureDetector(
      // 点击事件
      onTap: () {
        //底部消息提示
        final snackBar = new SnackBar(
          content: new Text("你已按下"),
          backgroundColor: Colors.blueAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      // 添加容器接收触摸动作
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        // 添加装饰器
        decoration: new BoxDecoration(
          // 设置颜色 ->Theme.of(context).buttonColor
          color: Theme.of(context).buttonColor,
          // new BorderRadius.circular(10.0)同BorderRadius.all(Radius.circular(10.0))
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new Text('测试按钮'),
      ),
    );
  }
}
