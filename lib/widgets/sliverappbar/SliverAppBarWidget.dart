import 'package:flutter/material.dart';

/*
 * SliverAppBar-Sliver应用栏
 */
class SliverAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SliverAppBar组件'),
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // SliverAppBar包含flexibleSpace
                SliverAppBar(
                  // 是否预留高度
                  primary: true,
                  // 文本主题
                  textTheme: TextTheme(display1: TextStyle()),
                  // 标题前面显示的一个控件
                  leading: Icon(Icons.home),
                  // 操作按钮
                  actions: <Widget>[
                    Icon(Icons.add),
                    Icon(Icons.search),
                  ],
                  // 设置阴影值
                  elevation: 20.0,
                  // 展开高度
                  expandedHeight: 200.0,
                  // 与floating结合使用
                  snap: false,
                  // 是否随着滑动隐藏标题
                  floating: false,
                  // 是否固定在顶部
                  pinned: true,
                  // 可折叠应用栏
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      '这是一个隐藏的标题',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    // 折叠区域背景
                    background: Image.network(
                      'http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: Center(
              child: Text('拖动试试！'),
            )),
      ),
    );
  }
}