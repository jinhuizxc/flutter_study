import 'package:flutter/material.dart';

// Transform矩阵转换示例
class TransformWidget extends StatelessWidget {
  String title;

  TransformWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        //父容器 作为背景
        child: Container(
          //背景颜色
          color: Colors.grey,
          //矩阵转换
          child: Transform(
            //对齐方式
            alignment: Alignment.topRight,
            //设置旋转值
            transform: Matrix4.rotationZ(0.3),
            //被旋转容器
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Transform矩阵转换'),
            ),
          ),
        ),
      ),
    );
  }
}
