import 'package:flutter/material.dart';

/*
 * 水平列表示例
 */
class HorizontalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "水平列表示例";
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          //添加容器
          body: Column(
            children: <Widget>[
              horizontalWidget(),
            ],
          )),
    );
  }

  Widget horizontalWidget() {
    return Container(
      //顶部外边距为20, horizontal: 10.0 距离左右2边的间距
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      //设定容器高度
      height: 200.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: <Widget>[
          //每个Container即为一个列表项
          Container(
            width: 160.0,
            color: Colors.lightBlue,
          ),
          Container(
            width: 160.0,
            color: Colors.amber,
          ),
          //此容器里"水平"及"列表"文字为垂直布局
          Container(
            width: 160.0,
            color: Colors.green,
            //垂直布局
            child: Column(
              children: <Widget>[
                Text(
                  '水平',
                  style: TextStyle(
                    // 字体加粗
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                Text(
                  '列表',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                Icon(Icons.list),
              ],
            ),
          ),
          Container(
            width: 160.0,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            width: 160.0,
            color: Colors.black,
          ),
          Container(
            width: 160.0,
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }

  Widget listWidget() {
    return ListView(
      children: <Widget>[
        ListTile(
          //添加图标
          leading: Icon(Icons.alarm),
          //添加文本
          title: Text('Alarm'),
        ),
        ListTile(
          //添加图标
          leading: Icon(Icons.alarm),
          //添加文本
          title: Text('Alarm'),
        ),
        ListTile(
          //添加图标
          leading: Icon(Icons.alarm),
          //添加文本
          title: Text('Alarm'),
        ),
      ],
    );
  }
}
