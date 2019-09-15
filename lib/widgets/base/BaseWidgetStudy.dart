import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/Expanded/ExpandedWidget.dart';
import 'package:flutter_study/widgets/anim/AnimWidget.dart';
import 'package:flutter_study/widgets/grid/GridWidget.dart';

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
      // Expanded-填充组件
      ExpandedWidget(),
      // 网格布局
      GridWidget(),
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
