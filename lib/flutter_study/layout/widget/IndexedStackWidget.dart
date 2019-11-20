import 'package:flutter/material.dart';

/*
 * IndexedStack布局示例
 */
class IndexedStackWidget extends StatelessWidget {
  String title;

  IndexedStackWidget({this.title});

  @override
  Widget build(BuildContext context) {
    // 创建IndexedStack
    var _stack = IndexedStack(
      index: 1, //设置索引为1就只显示文本内容了
      alignment: const FractionalOffset(0.2, 0.2),
      children: <Widget>[
        //索引为0
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/1.jpeg'),
          radius: 100.0,
        ),
        //索引为1
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent
          ),
          child: Text(
            'test',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _stack,
      ),
    );
  }
}
