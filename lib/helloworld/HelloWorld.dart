import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter',
      home: new Scaffold(
        appBar: AppBar(
          // 指定appBar颜色
          backgroundColor: Colors.red,
          title: Text('First Flutter'),
        ),
        // 外层容器 ->使子控件居中
        body: Center(
          // 容器
          child: Container(
            // 指定容器宽高
            width: 200,
            height: 200,
            color: Colors.green,
            // 文本相对外层容器的位置
            alignment: Alignment.bottomRight,
            child: Text('Hello world'),
          ),
        ),
      ),
    );
  }
}
