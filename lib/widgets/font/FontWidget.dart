import 'package:flutter/material.dart';

/*
 * 自定义字体
 */
class FontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义字体',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('自定义字体'),
        ),
        body: new Center(
          child: new Text('你好, Flutter',
              style: TextStyle(
                fontFamily: 'myfont',
                fontSize: 36.0
              ),),
        ),
      ),
    );
  }
}
