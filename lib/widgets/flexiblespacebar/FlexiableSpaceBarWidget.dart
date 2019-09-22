import 'package:flutter/material.dart';

/*
 * 可折叠组件
 * FlexibleSpaceBar
 */
class FlexibleSpaceBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexibleSpaceBar可折叠组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlexibleSpaceBar可折叠组件'),
        ),
        // 支持嵌套的可滚动视图
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // SliverAppBar包含flexibleSpace
                SliverAppBar(
                  // 展开高度
                  expandedHeight: 150.0,
                  // 是否随着滑动隐藏标题
                  floating: false,
                  // 是否固定在顶部
                  pinned: true,
                  // 可折叠应用栏
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      '可折叠的组件',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Image.network(
                      'http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: Center(
              child: Text('向上提拉，查看效果'),
            )),
      ),
    );
  }
}
