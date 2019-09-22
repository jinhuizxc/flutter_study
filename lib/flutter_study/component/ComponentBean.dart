import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/animation/AnimationPage.dart';
import 'package:flutter_study/flutter_study/boxconstraints/BoxConstraintsPage.dart';
import 'package:flutter_study/flutter_study/callback/CallBackPage.dart';
import 'package:flutter_study/flutter_study/collection/CollectionPage.dart';
import 'package:flutter_study/flutter_study/component/appbar/AppBarPage.dart';
import 'package:flutter_study/flutter_study/component/button/ButtonPage.dart';
import 'package:flutter_study/flutter_study/component/card/CardPage.dart';
import 'package:flutter_study/flutter_study/component/container/ContainerPage.dart';
import 'package:flutter_study/flutter_study/component/container/ContainerPage.dart';
import 'package:flutter_study/flutter_study/component/dio/DioTestPage.dart';
import 'package:flutter_study/flutter_study/component/gridview/GridViewPage.dart';
import 'package:flutter_study/flutter_study/component/image/ImagePage.dart';
import 'package:flutter_study/flutter_study/component/json/JsonPage.dart';
import 'package:flutter_study/flutter_study/component/listview/ListViewPage.dart';
import 'package:flutter_study/flutter_study/component/scaffold/ScaffoldPage.dart';
import 'package:flutter_study/flutter_study/component/stack/StackPage.dart';
import 'package:flutter_study/flutter_study/component/text/TextPage.dart';
import 'package:flutter_study/flutter_study/cupertino/CupertinoPage.dart';
import 'package:flutter_study/flutter_study/db/DBPage.dart';
import 'package:flutter_study/flutter_study/decoration/DecorationPage.dart';
import 'package:flutter_study/flutter_study/font/FontPage.dart';
import 'package:flutter_study/flutter_study/form/FormPage.dart';
import 'package:flutter_study/flutter_study/globalKey/GlobalKeyPage.dart';
import 'package:flutter_study/flutter_study/input/InputPage.dart';
import 'package:flutter_study/flutter_study/loadingdialog/LoadingDialogPage.dart';
import 'package:flutter_study/flutter_study/logo/FlutterLogoPage.dart';
import 'package:flutter_study/flutter_study/pageview/PageViewPage.dart';
import 'package:flutter_study/flutter_study/path_provider/PathProviderPage.dart';
import 'package:flutter_study/flutter_study/placeholder/PlaceHolderPage.dart';
import 'package:flutter_study/flutter_study/refresh/RefreshPage.dart';
import 'package:flutter_study/flutter_study/swiper/SwiperPage.dart';
import 'package:flutter_study/material_design/behavior/BehaviorPage.dart';
import 'package:flutter_study/material_design/bottomsheet/BottomSheetPage.dart';
import 'package:flutter_study/material_design/snackbar/SnackBarPage.dart';

/*
 * 组件bean
 */
class ComponentBean {
  String name;
  Widget targetWidget;
  String description;
  String illustration; // 插图

  ComponentBean(
      this.name, this.targetWidget, this.description, this.illustration);
}

// 组件list
List<ComponentBean> componentList = <ComponentBean>[
  ComponentBean('Container', ContainerPage(),
      "包含绘制widget、定位widget、尺寸widget的容器", 'assets/images/illustration_1.jpg'),
  ComponentBean("Button", ButtonPage(), "按钮，其中写onPress和不写，样式会有差异",
      "assets/images/illustration_2.jpg"),
  ComponentBean(
      "Text", TextPage(), "文本控件", "assets/images/illustration_3.jpg"),
  ComponentBean(
      "Image", ImagePage(), "图片控件", "assets/images/illustration_4.jpg"),
  ComponentBean("Card", CardPage(), "卡片布局，自带阴影和一定的圆角",
      "assets/images/illustration_5.jpg"),
  ComponentBean("Stack", StackPage(), "层叠布局，相当于Android中的FrameLayout",
      "assets/images/illustration_6.jpg"),
  ComponentBean(
      "Scaffold", ScaffoldPage(), "脚手架", "assets/images/illustration_7.jpg"),
  ComponentBean("json_serializable", JsonSerializablePage(),
      "json_serializable", "assets/images/illustration_7.jpg"),
  ComponentBean("Appbar", AppBarPage(), "就是AppBar嘛",
      "assets/images/illustration_8.jpg"),
  ComponentBean("ListView", ListViewPage(), "ListView",
      "assets/images/illustration_14.jpg"),
  ComponentBean(
      "GridView", GridViewPage(), "网格布局", "assets/images/illustration_8.jpg"),
  ComponentBean("页面传参与回调", CallBackPage(), "Navigator页面传参与回调",
      "assets/images/illustration_8.jpg"),
  ComponentBean(
      "BottomSheet",
      BottomSheetPage(),
      "BottomSheet是一个从屏幕底部滑起的列表（以显示更多的内容）。你可以调用showBottomSheet()或showModalBottomSheet弹出",
      "assets/images/illustration_18.jpg"),
  ComponentBean("GlobalKey", GlobalKeyPage(), "GlobalKeyPage",
      "assets/images/illustration_10.jpg"),
  ComponentBean("path_provider", PathProviderPage(), "path_provider",
      "assets/images/illustration_10.jpg"),
//  ComponentBean("SnackBar", SnackBarPage(), "SnackBar",
//      "assets/images/illustration_24.jpg"),
  ComponentBean("Cupertino风格控件", CupertinoPage(), "Cupertino风格控件",
      "assets/images/illustration_27.jpg"),
  ComponentBean("Animation", AnimationPage(), "Animation",
      "assets/images/illustration_34.jpg"),
  ComponentBean("LoadDialog", LoadingDialogPage(), "LoadDialog",
      "assets/images/illustration_34.jpg"),
  ComponentBean("DioTestPage", DioTestPage(), "使用第三方库Dio",
      "assets/images/illustration_34.jpg"),
  ComponentBean("Flow", null, "Flow", "assets/images/illustration_10.jpg"),
  ComponentBean("Table", null, "Table", "assets/images/illustration_11.jpg"),
  ComponentBean("Wrap", null, "Wrap", "assets/images/illustration_12.jpg"),
  ComponentBean(
      "ListBody", null, "ListBodyBar", "assets/images/illustration_13.jpg"),
  ComponentBean("CustomMultiChildLayout", null, "CustomMultiChildLayout",
      "assets/images/illustration_15.jpg"),
  ComponentBean(
      "Swiper", SwiperPage(), "Swiper", "assets/images/illustration_27.jpg"),
  ComponentBean(
      "Input", InputPage(), "输入框", "assets/images/illustration_16.jpg"),
  ComponentBean(
      "Form", FormPage(), "表单", "assets/images/illustration_17.jpg"),
  ComponentBean(
      "Decoration",
      DecorationPage(),
      "装饰器，对各个控件进行装饰，比如给文字添加下划线，给图片切圆角等等",
      "assets/images/illustration_18.jpg"),
  ComponentBean(
      "FlutterLogo",
      FlutterLogoPage(),
      "Flutter的Logo，可以设置大小，颜色，Logo和文字的排列",
      "assets/images/illustration_19.jpg"),
  ComponentBean(
      "Placeholder",
      PlaceHolderPage(),
      "占位符，一个用来占位的Widget，提示开发人员，这里需要暂时保留",
      "assets/images/illustration_20.jpg"),
  ComponentBean("CheckBox", null, "单选框", "assets/images/illustration_21.jpg"),
  ComponentBean(
      "RadioGroup", null, "多选框", "assets/images/illustration_22.jpg"),
  ComponentBean("Progress", null, "进度条", "assets/images/illustration_23.jpg"),
  ComponentBean("PageView", PageViewPage(), "PageView",
      "assets/images/illustration_24.jpg"),
  ComponentBean("BoxConstraints", BoxConstraintsPage(), "BoxConstraints",
      "assets/images/illustration_24.jpg"),
  ComponentBean("下拉刷新，上拉加载更多", RefreshPage(), "下拉刷新，上拉加载更多",
      "assets/images/illustration_27.jpg"),
  ComponentBean("SliverAppBar", null, "SliverAppBar",
      "assets/images/illustration_27.jpg"),
  ComponentBean("FlexibleSpaceBar", null, "FlexibleSpaceBar",
      "assets/images/illustration_26.jpg"),
  ComponentBean("behavior", BehaviorPage(), "behavior",
      "assets/images/illustration_29.jpg"),
  ComponentBean(
      "Expanded", null, "Expanded", "assets/images/illustration_30.jpg"),
  ComponentBean(
      "集合", CollectionPage(), "集合", "assets/images/illustration_31.jpg"),
  ComponentBean(
      "const和的区别", null, "const和的区别", "assets/images/illustration_32.jpg"),
  ComponentBean(
      "缓存", DBPage(), "DBPage", "assets/images/illustration_34.jpg"),
  ComponentBean(
      "全局变量", null, "全局变量的定义与使用", "assets/images/illustration_27.jpg"),
  ComponentBean(
      "IconButton", null, "IconButton", "assets/images/illustration_31.jpg"),
  ComponentBean(
      "ListTile", null, "ListTile", "assets/images/illustration_34.jpg"),
  ComponentBean(
      "自定义字体", FontPage(), "使用自定义字体", "assets/images/illustration_35.jpg"),
  ComponentBean("盒约束", null, "盒约束", "assets/images/illustration_27.jpg"),
  ComponentBean("国际化", null, "国际化", "assets/images/illustration_27.jpg"),
  ComponentBean("Flutter templates", null, "Flutter templates",
      "assets/images/illustration_27.jpg"),
  ComponentBean(
      "template", null, "template", "assets/images/illustration_27.jpg"),
];
