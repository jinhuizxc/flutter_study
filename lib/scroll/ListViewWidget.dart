import 'package:flutter/material.dart';

// 滚动  滚动一个拥有多个子组件的父组件
// ListView  一个可滚动的列表

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewWidget();
  }
}

class _ListViewWidget extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 没有设置主题风格, 效果显示很差;
//    return new MaterialApp(
//      home: _MyScroll(),
//    );
  // 优雅的显示
    return new MaterialApp(
      title: 'ScrollWidgetTest',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("ScrollWidget"),
        ),
        body: _MyListViewWidget(),
      ),
    );
  }

  Widget _MyListViewWidget() {
    return new ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        new Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(
            child: Text('Entry A'),
          ),
        ),
        new Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        new Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        )
      ],
    );
  }
}

// sample
class ListViewWidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewWidget1();
  }
}

class _ListViewWidget1 extends State<ListViewWidget1> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // 优雅的显示
    return new MaterialApp(
      title: 'sample2',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("sample2"),
        ),
//        body: ListView.builder(   // ListView.builder的使用
//            padding: const EdgeInsets.all(8.0),
//            itemCount: entries.length,
//            itemBuilder: (BuildContext context, int index) {
//              return Container(
//                height: 50,
//                color: Colors.amber[colorCodes[index]],
//                child: Center(child: Text('Entry ${entries[index]}')),
//              );
//            }
//        ),

//      body: ListView.separated(   // ListView.separated的使用
//        padding: const EdgeInsets.all(8.0),
//        itemCount: entries.length,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            height: 50,
//            color: Colors.amber[colorCodes[index]],
//            child: Center(child: Text('Entry1 ${entries[index]}')),
//          );
//        },
//        separatorBuilder: (BuildContext context, int index) => const Divider(),
//      ),

//      body: ListView(  // 下面是两个简短的片段，展示了一个列表视图及其等价的CustomScrollView:
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(20.0),
//        children: <Widget>[
//          const Text('I\'m dedicating every day to you'),
//          const Text('Domestic life was never quite my style'),
//          const Text('When you smile, you knock me out, I fall apart'),
//          const Text('And I thought I was so smart'),
//        ],
//      ),

      body: CustomScrollView(   // CustomScrollView的使用
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const Text('I\'m dedicating every day to you'),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart11'),
                ],
              ),
            ),
          ),
        ],
      ),


      ),
    );
  }

}
