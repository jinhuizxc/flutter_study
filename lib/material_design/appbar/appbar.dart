import 'package:flutter/material.dart';

/*
 * AppBar应用按钮示例
 */
class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //应用按钮
      appBar: AppBar(
        //标题
        title: Text('AppBar应用按钮示例'),
        //左侧图标
//        leading: Icon(Icons.home),
        //操作按钮集
        actions: <Widget>[
          //图标按钮
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
