import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Grid网格控件',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Grid网格控件'),
        ),
        body: GridTest(),
      ),
    );
  }
}

class GridTest extends StatefulWidget {
  @override
  _GridTestState createState() => _GridTestState();
}

class _GridTestState extends State<GridTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 400.0,
      // GridView 横向排版
      child: GridView.count(
        // 列的个数
        crossAxisCount: 2,
        // 垂直空隙
        mainAxisSpacing: 10.0,
        // 水平空隙
        crossAxisSpacing: 4.0,
        // 内边距
        padding: EdgeInsets.all(4.0),
        children: <Widget>[
          // 网格标题基本用法
          GridTile(
            header: Text('grid header'),
//              child: Text('grid child'),
            // 将文本换成图片展示
            child: Image.asset('assets/images/cat.jpeg'),
            footer: Text('grid footer'),
          ),
          Image.asset('assets/images/cat.jpeg'),
          GridTile(
            header: GridTileBar(
              // 设置GridTileBar的背景颜色
              backgroundColor: Colors.greenAccent,
              // 标题
              title: Text(
                '我是header',
                style: TextStyle(color: Colors.red),
              ),
//                subtitle: Text('我是子标题', style: TextStyle(color: Colors.black),),
              // 前置图标
              leading: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
//              child: Text('grid child'),
            // 将文本换成图片展示
            child: Image.asset('assets/images/cat.jpeg',),
            footer: GridTileBar(
              // 设置GridTileBar的背景颜色
              backgroundColor: Colors.greenAccent,
              // 标题
              title: Text(
                '我是footer',
                style: TextStyle(color: Colors.red),
              ),
//                subtitle: Text('我是子标题', style: TextStyle(color: Colors.black),),
              // 前置图标
              leading: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
          ),
          Image.asset('assets/images/cat.jpeg'),
          // 添加网格效果
          GridPaper(
            // 网格线的颜色
            color: Colors.blueAccent,
            child: Image.asset(
              'assets/images/cat.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Image.asset('assets/images/cat.jpeg'),
        ],
      ),
    );
  }
}
