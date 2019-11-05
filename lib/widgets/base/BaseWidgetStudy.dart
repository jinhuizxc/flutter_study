import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/component/InkWellTest.dart';
import 'package:flutter_study/flutter_study/router/router_study.dart';
import 'package:flutter_study/flutter_study/stack/stack_study.dart';
import 'package:flutter_study/flutter_study/state/tapbox_a.dart';
import 'package:flutter_study/flutter_study/state/tapbox_b.dart';
import 'package:flutter_study/flutter_study/state/tapbox_c.dart';
import 'package:flutter_study/life_cycle/life_cycle.dart';
import 'package:flutter_study/material_design/textfield/TextFieldWidget.dart';
import 'package:flutter_study/sample/layout/layout_test.dart';
import 'package:flutter_study/scroll/ListViewWidget.dart';
import 'package:flutter_study/widgets/Expanded/ExpandedWidget.dart';
import 'package:flutter_study/widgets/align/AlignLayout.dart';
import 'package:flutter_study/widgets/anim/AnimWidget.dart';
import 'package:flutter_study/widgets/button/icon_button/IconButtonWidget.dart';
import 'package:flutter_study/widgets/container/ContainerWidget.dart';
import 'package:flutter_study/widgets/container/Horizontal.dart';
import 'package:flutter_study/widgets/flexiblespacebar/FlexiableSpaceBarWidget.dart';
import 'package:flutter_study/widgets/formdata/FormDataWidget.dart';
import 'package:flutter_study/widgets/gridView/GridWidget.dart';
import 'package:flutter_study/widgets/gridView/GridWidget1.dart';
import 'package:flutter_study/widgets/icon/IconWidget.dart';
import 'package:flutter_study/widgets/image/ImageWidget.dart';
import 'package:flutter_study/widgets/listview/ListTest.dart';
import 'package:flutter_study/widgets/sliverappbar/SliverAppBarWidget.dart';
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
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      //
      TextFieldWidget(),
      // 生命周期测试
      WidgetTest(),
      // Align对齐布局示例
      AlignLayout(),
      // StackStudy
      StackStudy(),
      // 路由和导航
      RouterStudy(),
      // widget管理自己的状态
      TapboxATest(),
      // 父widget管理widget的state
      ParentWidgetTest(),
      // 混搭管理
      ParentWidgetTest1(),
      // InkWell测试
      InkWellTest(),
      // 基础布局
      LayoutTest(),
      // SliverAppBar-Sliver应用栏
      SliverAppBarWidget(),
      // 可折叠组件
      FlexibleSpaceBarWidget(),
      // 水平列表示例
      HorizontalWidget(),
      // 容器组件
      ContainerWidget(),
      // 表单组件
      LoginPage(),
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
