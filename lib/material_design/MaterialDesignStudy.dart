import 'package:flutter/material.dart';
import 'package:flutter_study/material_design/alertdialog/AlertDialogWidget.dart';
import 'package:flutter_study/material_design/alertdialog/SimpleDialogWidget.dart';

class MaterialDesignStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialDesign风格组件',
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
      // AlertDialog对话框组件
      AlertDialogWidget(),
      // SimpleDialog组件示例
      SimpleDialogWidget(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialDesign风格组件'),
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

