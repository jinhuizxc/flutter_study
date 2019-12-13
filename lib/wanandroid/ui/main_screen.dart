import 'package:flutter/material.dart';

/// 首页
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

/// AutomaticKeepAliveClientMixin: 页面保持状态，不重绘
class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {

  PageController _pageController = new PageController();

  /// 当前选中的索引
  int _currentIndex = 0;

  /// tabs的名字
//  final bottomBarTitles = ["首页", "广场", "公众号", "体系", "项目"];
  List bottomBarTitles = ["首页", "广场", "公众号", "体系", "项目"];


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}
