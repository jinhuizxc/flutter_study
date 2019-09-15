import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Expanded组件',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Expanded组件'),
        ),
        body: ExpandedTest(),
      ),
    );
  }
}

/*
 * 填充布局
 * Flexible(child: null)
 * Expanded(child: null)
 *
 */
class ExpandedTest extends StatefulWidget {
  @override
  _ExpandedTestState createState() => _ExpandedTestState();
}

class _ExpandedTestState extends State<ExpandedTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            child: Text('红色按钮'),
            // onPressed: null或者不写，按钮颜色体现不出来，需要改为空方法
            onPressed: () {},
          ),
          // 填充剩余所有空间
          Expanded(
            flex: 1,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('蓝色按钮'),
              onPressed: () {},
            ),
          ),

          RaisedButton(
            color: Colors.red,
            child: Text('红色按钮'),
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            child: Text('红色按钮'),
            // onPressed: null或者不写，按钮颜色体现不出来，需要改为空方法
            onPressed: () {},
          ),
          // 填充剩余可能空间
          Flexible(
            flex: 1,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('蓝色按钮'),
              onPressed: () {},
            ),
          ),
          RaisedButton(
            color: Colors.red,
            child: Text('红色按钮'),
            onPressed: () {},
          ),
        ],
      ),
    ]));
  }
}
