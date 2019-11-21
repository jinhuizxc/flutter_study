import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  String title;

  PaddingWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        //添加容器 外框
        child: Container(
          width: 300,
          height: 300,
//          color: Colors.grey,  TODO 装饰器有颜色值, 外层不能设置颜色值
          //容器内边距上下左右设置为60.0
          padding: EdgeInsets.all(60.0),
          //添加边框
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
              color: Colors.green,
              width: 8.0,
            ),
          ),
          //添加容器 内框
          child: Container(
            width: 200.0,
            height: 200.0,
//            color: Colors.blueAccent,
            //添加边框
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.blue,
                width: 8.0,
              ),
            ),

//            child: Text(
//              '测试',
//            ),
            //添加图标
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
