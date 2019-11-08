import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/eventbus_page.dart';
import 'package:flutter_study/flutter_study/clip/clip_study.dart';
import 'package:flutter_study/gesture/GestureStudy.dart';
import 'package:flutter_study/material_design/MaterialDesignStudy.dart';
import 'package:flutter_study/sample/flutter_sample.dart';
import 'package:flutter_study/sample/flutter_study_app/flutter_study_app.dart';
import 'package:flutter_study/sample/flutter_wxread/FlutterWxReadApp.dart';
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
      // Clip剪裁处理
      ClipStudy(),
      // someSample
      FlutterSample(),
      // FlutterStudyApp
      FlutterStudyApp(),
      // 微信读书App
      FlutterWxReadApp(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter组件学习'),
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
