import 'package:flutter/material.dart';
import 'package:flutter_study/material_design/bottomnavigationbar/sample/BottomNavigationBarWidgetSample.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/AlertDialogWidget.dart';
import 'package:flutter_study/material_design/dialog/alertdialog/SimpleDialogWidget.dart';
import 'package:flutter_study/material_design/drawer/DrawerWidget.dart';
import 'package:flutter_study/material_design/floatactionbutton/FloatingActionButtonWidget.dart';
import 'package:flutter_study/material_design/popupmenu/PopupMenuButtonWidget.dart';
import 'package:flutter_study/material_design/snackbar/SnackBarWidget.dart';
import 'package:flutter_study/material_design/snackbar/SnackBarWidget1.dart';
import 'package:flutter_study/material_design/tabbar/default_tabController.dart';
import 'package:flutter_study/material_design/tabbar/tabbar.dart';
import 'package:flutter_study/material_design/textfield/TextFieldWidget.dart';

import 'bottomnavigationbar/BottomNavigationBarWidget.dart';
import 'card/CardWidget.dart';
import 'flatbutton/FlatButtonWidget.dart';

class MaterialDesignStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // Card布局示例
      CardWidget(),
      // AlertDialog对话框组件
      AlertDialogWidget(),
      // 抽屉组件
      DrawerWidget(),
      // 扁平按钮组件
      FlatButtonWidget(),
      // FloatingActionButton示例
      FloatingActionButtonWidget(),
      // PopupMenuButton弹出菜单组件
      PopupMenuButtonWidget(),
      // DefaultTabController示例
      DefaultTabControllerSample(),
      // TabBar水平选项卡及视图组件
      TabBarWidget(),
      // SimpleDialog组件示例
      SimpleDialogWidget(),
      // TextFieldWidget
      TextFieldWidget(),
      // BottomNavigationBarWidget学习
      BottomNavigationBarWidgetStudy(),
      // Flutter学习之制作底部菜单导航
      BottomNavigationBarWidgetSample(),
      // SnackBar轻量提示组件
      SnackBarWidget(),
      SnackBarWidget1(),

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
