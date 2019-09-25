import 'package:flutter/material.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/AlertDialogWidget.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/SimpleDialogWidget.dart';
import 'package:flutter_study/material_design/floatactionbutton/FloatingActionButtonWidget.dart';
import 'package:flutter_study/material_design/snackbar/SnackBarWidget.dart';
import 'package:flutter_study/material_design/snackbar/SnackBarWidget1.dart';
import 'package:flutter_study/material_design/textfield/TextFieldWidget.dart';

import 'bottomnavigationbar/BottomNavigationBarWidget.dart';
import 'card/CardWidget.dart';
import 'flatbutton/FlatButtonWidget.dart';

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
      // Card布局示例
      CardWidget(),
      // FlatButton组件
      FlatButtonWidget(),
      // AlertDialog对话框组件
      AlertDialogWidget(),
      // SimpleDialog组件示例
      SimpleDialogWidget(),
      // TextFieldWidget
      TextFieldWidget(),
      // BottomNavigationBarWidget学习
      BottomNavigationBarWidget(),
      // SnackBar轻量提示组件
      SnackBarWidget(),
      SnackBarWidget1(),
      // FloatingActionButton示例
      FloatingActionButtonWidget()
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
