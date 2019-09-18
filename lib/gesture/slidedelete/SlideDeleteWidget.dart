import 'package:flutter/material.dart';

/*
 * 滑动删除组件
 */
class SlideDeleteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '滑动删除示例',
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  //构建30条列表数据
  List<String> items =
      new List<String>.generate(30, (item) => '列表项 ${item + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('滑动删除示例'),
      ),
      body: ListView.builder(
        itemCount: items.length, //指定列表长度
        itemBuilder: (context, index) {
          //提取出被删除的项
          final item = items[index];
          //返回一个可以被删除的列表项
          return Dismissible(
            key: new Key(item),
            //被删除回调
            onDismissed: (direction) {
              //移除指定索引项
              items.removeAt(index);
              //底部弹出消息提示当前项被删除了
              Scaffold.of(context)
                  .showSnackBar(new SnackBar(content: new Text('$item 被删除了')));
            },
            child: new ListTile(
              title: new Text('$item'),
            ),
          );
        }, //构建列表
      ),
    );
  }
}
