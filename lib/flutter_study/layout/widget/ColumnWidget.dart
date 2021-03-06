import 'package:flutter/material.dart';

/*
 * Column垂直布局
 */
class ColumnWidget extends StatelessWidget {
  String title;

  ColumnWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //垂直布局
     /* body: Column(
        children: <Widget>[
          Text('Flutter'),
          Text('垂直布局'),
          //添加图标
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          ))
        ],
      ),*/

     // 文本按垂直方向排列
      body: Column(
        //水平方向靠左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Flutter是谷歌的移动UI框架'),
          Text('可以快速在iOS和Android上构建高质量的原生用户界面'),
          Text('Flutter可以与现有的代码一起工作。在全世界'),
          Text('Flutter正在被越来越多的开发者和组织使用'),
          Text('并且Flutter是完全免费、开源的。'),
          Text('Flutter!', style: TextStyle(fontSize: 36.0,)),//放大字号
        ],
      ),
    );
  }
}
