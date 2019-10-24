import 'package:flutter/material.dart';
import 'package:flutter_study/%E7%BB%84%E4%BB%B6%E8%A3%85%E9%A5%B0%E5%92%8C%E8%A7%86%E8%A7%89%E6%95%88%E6%9E%9C/Clip%E5%89%AA%E8%A3%81%E5%A4%84%E7%90%86/ClipOval%E5%9C%86%E5%BD%A2%E5%89%AA%E8%A3%81/main.dart';
import 'package:flutter_study/%E7%BB%84%E4%BB%B6%E8%A3%85%E9%A5%B0%E5%92%8C%E8%A7%86%E8%A7%89%E6%95%88%E6%9E%9C/Clip%E5%89%AA%E8%A3%81%E5%A4%84%E7%90%86/ClipPath%E8%B7%AF%E5%BE%84%E5%89%AA%E8%A3%81/main.dart';
import 'package:flutter_study/%E7%BB%84%E4%BB%B6%E8%A3%85%E9%A5%B0%E5%92%8C%E8%A7%86%E8%A7%89%E6%95%88%E6%9E%9C/Clip%E5%89%AA%E8%A3%81%E5%A4%84%E7%90%86/ClipRRect%E5%9C%86%E8%A7%92%E7%9F%A9%E5%BD%A2%E5%89%AA%E8%A3%81/main.dart';
import 'package:flutter_study/%E7%BB%84%E4%BB%B6%E8%A3%85%E9%A5%B0%E5%92%8C%E8%A7%86%E8%A7%89%E6%95%88%E6%9E%9C/Clip%E5%89%AA%E8%A3%81%E5%A4%84%E7%90%86/ClipRect%E7%9F%A9%E5%BD%A2%E5%89%AA%E8%A3%81/main.dart';
import 'package:flutter_study/gesture/GestureStudy.dart';
import 'package:flutter_study/material_design/MaterialDesignStudy.dart';
import 'package:flutter_study/widgets/base/BaseWidgetStudy.dart';

/*
 * 组件的学习
 */
class WidgetStudy extends StatefulWidget {
  @override
  _WidgetStudyState createState() => _WidgetStudyState();
}

class _WidgetStudyState extends State<WidgetStudy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '组件学习',
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
      // 基础组件学习
      BaseWidgetStudy(),
      // MaterialDesign学习
      MaterialDesignStudy(),
      // 手势组件
      GestureStudy(),
      // ClipOval圆形剪裁
      ClipOvalSample(),
      // ClipPath路径剪裁示例
      ClipPathSample(),
      // ClipRect矩形剪裁示例
      ClipRectSample(),
      // ClipRRect圆角矩形剪裁示例
      ClipRRectSample(),


    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('组件学习'),
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
