import 'package:flutter/material.dart';
import 'package:flutter_study/sample/layout/favorite.dart';

/*
 * 在Flutter中构建布局
 * 参考官方文档地址： https://flutterchina.club/tutorials/layout/
 */
class LayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
     * 创建纵向列， 含有图片icon，文本label
     */
    buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // 实现标题行
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // 无状态的widget
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41'),
        // 将有 stateful widget 插入 widget 树中
          FavoriteWidget(),

        ],
      ),
    );

    // 实现按钮行
    Widget buttonSection = new Container(
      child: new Row(
        // 横向分布的三个列
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    // 实现文本部分, 将文本放入容器中，以便沿每条边添加32像素的填充。softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('在Flutter中构建布局'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'assets/images/lake_01.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      );
  }
}
