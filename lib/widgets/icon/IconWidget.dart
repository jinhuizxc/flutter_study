import 'package:flutter/material.dart';

/*
 * 图标组件
 */
class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图标组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('图标组件示例'),
        ),
        //添加图标
        body: Icon(
          //图标内容
          Icons.phone,
          //图标颜色
          color: Colors.green[500],
          //图标大小
          size: 80.0,
        ),
      ),
    );
  }
}
