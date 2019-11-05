import 'package:flutter/material.dart';

import 'Clip剪裁处理/ClipOval圆形剪裁/main.dart';
import 'Clip剪裁处理/ClipPath路径剪裁/main.dart';
import 'Clip剪裁处理/ClipRRect圆角矩形剪裁/main.dart';
import 'Clip剪裁处理/ClipRect矩形剪裁/main.dart';



class ClipStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // ClipOval圆形剪裁
      ClipOvalSample(),
      // ClipPath路径剪裁示例
      ClipPathSample(),
      // ClipRect矩形剪裁示例
      ClipRectSample(),
      // ClipRRect圆角矩形剪裁示例
      ClipRRectSample(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Clip剪裁处理'),
      ),
      // ListView学习
      body: ListView(
        children: list.map((widget) {
          return ListTile(
            title: Text(widget.toString()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => widget),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
