import 'package:flutter/material.dart';

/*
 * 图片组件
 */
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图片组件',
      //居中展示
      home: Center(
        //添加网络图片
        child: Image.network(
          'https://avatars0.githubusercontent.com/u/24784194?s=460&v=4',
          //填充模式, 宽度填充
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
