import 'package:flutter/material.dart';

/*
 * 凸起按钮组件
 */
class RaisedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaisedButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RaisedButton组件示例'),
        ),
        body: Center(
          //RaisedButton具有一种立体感
          child: RaisedButton(
            //按下事件响应
            onPressed: () {
              print('按钮被点击啦...');
            },
            //添加按钮文本
            child: Text('我是RaisedButton'),
          ),
        ),
      ),
    );
  }
}
