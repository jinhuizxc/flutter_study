// CustomScrollView  一个使用slivers创建自定义的滚动效果的ScrollView

import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _CustomScrollViewWidget();
  }
}

class _CustomScrollViewWidget extends State<CustomScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
// 优雅的显示
    return new MaterialApp(
      title: 'ScrollWidgetTest',
      home: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
