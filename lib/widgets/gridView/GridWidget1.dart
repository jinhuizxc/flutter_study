import 'package:flutter/material.dart';

/*
 * 网格列表示例
 * Flutter GridView 控件
 * https://www.jianshu.com/p/aec6fee34f70
 *
 * primary → bool 	这是否是与父 PrimaryScrollController 关联的主滚动视图。
 *
 */
class GridWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "网格列表示例";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        //使用GridView.count构建网格
        body: GridView.count(
          // 这是否是与父 PrimaryScrollController 关联的主滚动视图
          primary: false,
          //一行上放三列数据 (crossAxis: 横轴)
          crossAxisCount: 3,
          //四周增加一定的空隙
          padding: const EdgeInsets.all(20.0),
          // 横轴列之间的间距
          crossAxisSpacing: 30.0,
          //数据项 五行三列
          children: <Widget>[
            const Text('1'),
            const Text('2'),
            const Text('3'),

            const Text('4'),
            const Text('5'),
            const Text('6'),

            const Text('7'),
            const Text('8'),
            const Text('9'),

            const Text('10'),
            const Text('11'),
            const Text('12'),
            
            const Text('13'),
            const Text('14'),
            const Text('15'),
          ],
          
        ),
      ),
    );
  }
}
