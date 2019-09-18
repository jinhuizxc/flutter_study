import 'package:flutter/material.dart';
import 'package:flutter_study/gesture/gesturedetector/GestureDetectorWidget.dart';
import 'package:flutter_study/gesture/slidedelete/SlideDeleteWidget.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/AlertDialogWidget.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/SimpleDialogWidget.dart';

/*
 * 手势组件学习
 */
class GestureStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '手势组件学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // 滑动删除
      SlideDeleteWidget(),
      GestureDetectorWidget(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('手势组件学习'),
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

