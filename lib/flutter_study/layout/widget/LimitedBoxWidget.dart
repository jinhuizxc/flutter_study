import 'package:flutter/material.dart';

/*
 * LimitedBox限定宽高布局示例
 */
class LimitedBoxWidget extends StatelessWidget {
  String title;

  LimitedBoxWidget({this.title});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 150,  //设置最大宽度 限定child在此范围内
            child: Container(
              color: Colors.lightGreen,
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
