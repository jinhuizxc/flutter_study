import 'package:flutter/material.dart';

/*
 * Center居中布局示例
 */
class CenterWidget extends StatelessWidget {
  String title;

  CenterWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //居中组件 位于body的中心位置
      body: Center(
        //添加文本
        child: Text('Hello World', style: TextStyle(fontSize: 36.0),),
      ),
    );
  }
}
