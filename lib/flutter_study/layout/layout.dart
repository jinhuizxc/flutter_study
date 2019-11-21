
import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/layout/detail_screen.dart';
import 'package:flutter_study/flutter_study/layout/widget/AspectRatioWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/BaselineWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/CenterWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/ColumnWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/ConstrainedBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/FittedBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/FractionallySizedBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/GridViewWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/LayoutSampleWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/LimitedBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/ListViewLongTextWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/ListViewWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/OffstageWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/OverflowBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/PaddingWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/RowWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/SizeBoxWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/StackAligmentWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/StackPositionWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/TableWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/TransformWidget.dart';
import 'package:flutter_study/flutter_study/layout/widget/WrapWidget.dart';

import 'widget/IndexedStackWidget.dart';

/*
 * 页面布局
 * 1. AspectRatio调整宽高比
 */
/*class LayoutStudy extends StatelessWidget {
  List<ListData> list = <ListData>[
    ListData(title: 'AspectRatio调整宽高比'),
    ListData(title: 'Baseline基准线布局'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面布局'),
      ),
      body: ListView(
        children: list.map((item) {
          return ListTile(
            title: Text(item.title),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(title: item.title),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class ListData {
  String title;

  ListData({this.title});
}*/

class LayoutStudy extends StatelessWidget {

  List<Widget> list = <Widget>[
    AspectRatioWidget(title: 'AspectRatio调整宽高比'),
    BaselineWidget(title: 'Baseline基准线布局'),
    CenterWidget(title: 'Center居中布局示例'),
    ColumnWidget(title: 'Column垂直布局'),
    ConstrainedBoxWidget(title: 'ConstrainedBox限定宽高'),
    FittedBoxWidget(title: 'FittedBox缩放布局示例'),
    FractionallySizedBoxWidget(title: 'FractionallySizedBox百分比布局示例'),
    GridViewWidget(title: 'GridView九宫格示例'),
    IndexedStackWidget(title: 'IndexedStack布局示例'),
    LimitedBoxWidget(title: 'LimitedBox限定宽高布局示例'),
    ListViewWidget(title: 'ListView布局示例'),
    ListViewLongTextWidget(title: '长文本滚动布局示例'),
    OffstageWidget(title: 'Offstage控制是否显示组件'),
    OverflowBoxWidget(title: 'OverflowBox溢出父容器显示'),
    PaddingWidget(title: 'Padding填充布局'),
    RowWidget(title: 'Row水平布局'),
    SizeBoxWidget(title: 'SizedBox设置具体尺寸示例'),
    StackAligmentWidget(title: 'Stack布局示例Alignment'),
    StackPositionWidget(title: '层叠定位布局示例'),
    TableWidget(title: 'Table表格布局示例'),
    TransformWidget(title: 'Transform矩阵转换示例'),
    WrapWidget(title: 'Wrap按宽高自动换行布局示例'),
    LayoutSampleWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面布局'),
      ),
      body: ListView(
        children: list.map((widget) {
          return ListTile(
            title: Text(widget.toString()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => widget,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

