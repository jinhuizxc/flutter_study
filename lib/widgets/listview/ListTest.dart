import 'package:flutter/material.dart';

/*
 * 长列表组件
 */
class LongList extends StatelessWidget {
  //列表数据集
  final List<String> items;

//构造方法用于接收列表数据集
  LongList({this.items, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = '长列表示例';
    return new MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        //  使用ListView.builder来构造列表项
        body: ListView.builder(
          //列表项构造器 context为上下文 index表示列表项索引
          itemBuilder: (context, index){
            //返回列表项
            return ListTile(
              //文本内容
              title: Text('${items[index]}'),
              //左侧图标
              leading: Icon(Icons.phone),
            );
          },
          //列表长度
          itemCount: items.length,
        ),
      ),
    );
  }
}
