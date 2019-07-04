import 'package:flutter/material.dart';

/*
 样例模板，便于复制粘贴;

 * class GridViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GridViewWidget();
  }
}

class _GridViewWidget extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 优雅的显示
    return new MaterialApp(
      title: 'ScrollWidgetTest',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("ScrollWidget"),
        ),
        body: Text('TEXT'),
      ),
    );
  }
}
 */
class GridViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GridViewWidget();
  }
}

class _GridViewWidget extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ScrollWidgetTest',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("ScrollWidget"),
        ),
//        body: _MyGridView(),
        body: _CustomView(),
      ),
    );
  }

  // 自定义CustomScrollView
  Widget _CustomView(){
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              const Text('He\'d have you all unravel at the'),
              const Text('Heed not the rabble'),
              const Text('Sound of screams but the'),
              const Text('Who scream'),
              const Text('Revolution is coming...'),
              const Text('Revolution, they1'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _MyGridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: <Widget>[
        const Text('He\'d have you all unravel at the'),
        const Text('Heed not the rabble'),
        const Text('Sound of screams but the'),
        const Text('Who scream'),
        const Text('Revolution is coming...'),
        const Text('Revolution, they'),
      ],
    );
  }
}
