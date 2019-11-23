import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/base_study/theme/ThemeStudy.dart';
import 'package:flutter_study/flutter_study/font/FontWidget.dart';
import 'package:flutter_study/flutter_study/layout/layout.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/eventbus_page.dart';
import 'package:flutter_study/flutter_study/clip/clip_study.dart';
import 'package:flutter_study/gesture/GestureStudy.dart';
import 'package:flutter_study/material_design/MaterialDesignStudy.dart';
import 'package:flutter_study/sample/flutter_sample.dart';
import 'package:flutter_study/sample/flutter_study_app/flutter_study_app.dart';
import 'package:flutter_study/sample/flutter_wxread/FlutterWxReadApp.dart';
import 'package:flutter_study/widgets/base/BaseWidgetStudy.dart';

import 'http/HttpClientStudy.dart';
import 'http/HttpStudy.dart';
import 'http/dio/DioStudy.dart';
import 'package/ThreePacWidget.dart';

// 第2章Flutter基础知识
class BaseStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // Flutter主题
      ThemeStudy(),
      // 使用第三方包示例
      ThreePacStudy(),
      HttpStudy(),
      // dio请求
      DioStudy(),
      // 发起HttpClient请求
      HttpClientStudy(),
//      ThemeWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('第2章Flutter基础知识'),
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
