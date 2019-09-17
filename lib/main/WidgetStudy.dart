import 'package:flutter/material.dart';
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
