import 'package:flutter/material.dart';

// 水平布局示例
class RowWidget extends StatelessWidget {
  String title;

  RowWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //水平布局
      body: Row(
        children: <Widget>[
          Expanded(
            // 为了让text显示更明显一些，外层添加一个Container，并设置颜色，可以看到是充满了宽度
            child: Container(
              color: Colors.blueAccent,
              child: Text('左侧文本', textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Text('中间文本', textAlign: TextAlign.center),
            ),
          ),
          //右侧图标   这里可以看到图片的高度将这个row高度撑开了，
          // 如果注释掉这个FlutterLogo图片，那么仅仅是text的高度;
          Expanded(
            child: Container(
              child: FittedBox(
                fit: BoxFit.contain,
                child: const FlutterLogo(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
