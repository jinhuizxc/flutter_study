import 'package:flutter/material.dart';

// SizedBox设置具体尺寸示例
class SizeBoxWidget extends StatelessWidget {
  String title;

  SizeBoxWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // 定义一个card视图， 用一个SizeBox约束子控件的大小！
      body: SizedBox(
        //固定宽为200.0 高为300.0
        width: 200,
        height: 300,
        child: const Card(
//          color: Colors.red,  // 设置Card的显示颜色
          child: Text(
            'SizeBox',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}
