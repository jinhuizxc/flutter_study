import 'package:flutter/material.dart';

/*
 * ConstrainedBox限定宽高
 *
 */
class ConstrainedBoxWidget extends StatelessWidget {
  String title;

  ConstrainedBoxWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // 添加容器
      body: ConstrainedBox(
        //设置限定值 (本来会大一些，但是限制了大小后变的小了)
        constraints: BoxConstraints(
//          minWidth: 0.0,
//          maxWidth: double.infinity,
//          minHeight: 0.0,
//          maxHeight: double.infinity,

          minWidth: 150.0,
          minHeight: 150.0,
          maxWidth: 220.0,
          maxHeight: 220.0,
        ),
        //子容器
        child: Container(
          width: 300,
          height: 300,
          color: Colors.green,
        ),
      ),
    );
  }
}
