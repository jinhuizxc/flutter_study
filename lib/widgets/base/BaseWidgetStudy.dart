import 'package:flutter/material.dart';
import 'package:flutter_study/scroll/ListViewWidget.dart';
import 'package:flutter_study/widgets/Expanded/ExpandedWidget.dart';
import 'package:flutter_study/widgets/anim/AnimWidget.dart';
import 'package:flutter_study/widgets/button/icon_button/IconButtonWidget.dart';
import 'package:flutter_study/widgets/formdata/FormDataWidget.dart';
import 'package:flutter_study/widgets/gridView/GridWidget.dart';
import 'package:flutter_study/widgets/gridView/GridWidget1.dart';
import 'package:flutter_study/widgets/icon/IconWidget.dart';
import 'package:flutter_study/widgets/image/ImageWidget.dart';
import 'package:flutter_study/widgets/listview/ListTest.dart';
import 'package:flutter_study/widgets/text/TextWidget.dart';

class BaseWidgetStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基础组件学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
    ;
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // 表单组件
      FormDataWidget(),
      // 图标按钮组件
      IconButtonWidget(),
      // 图标组件
      IconWidget(),
      // 图片组件
      ImageWidget(),
      // 文本组件
      TextWidget(),
      // 长列表组件
      //使用generate方法产生500条数据
      LongList(items: new List<String>.generate(500, (i) => 'Item $i')),
      // 基础列表示例
      ListViewWidget(),
      // Expanded-填充组件
      ExpandedWidget(),
      // 网格布局
      GridWidget(),
      // 网格列表示例
      GridWidget1(),
      // 动画布局
      AnimWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件学习'),
      ),
      // ListView学习
      body: ListView(
        children: list.map((widget) {
          return ListTile(
            title: Text(widget.toString()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => widget),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
