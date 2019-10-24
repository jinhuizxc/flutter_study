import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/HomePage.dart';
import 'package:flutter_study/material_design/bottomnavigationbar/sample/IdeaPage.dart';
import 'package:flutter_study/material_design/bottomnavigationbar/sample/NavigationIconView.dart';

import 'MarketPage.dart';

/*
 * Flutter学习之制作底部菜单导航
 * https://blog.csdn.net/qq_18948359/article/details/81409861
 */
class BottomNavigationBarWidgetSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter学习之制作底部菜单导航",
      theme: new ThemeData(
        primarySwatch: Colors.blue, // 设置主题颜色
      ),
      home: SampleApp(),
    );
  }
}

class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

// 要让主页面 Index 支持动效，要在它的定义中附加mixin类型的对象TickerProviderStateMixin
class _SampleAppState extends State<SampleApp> with TickerProviderStateMixin{

  int _currentIndex = 0;    // 当前界面的索引值
  List<NavigationIconView> _navigationViews;  // 底部图标按钮区域
  List<StatefulWidget> _pageList;   // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage;  // 当前的显示页面

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化导航图标
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(icon: new Icon(Icons.assessment), title: new Text("首页"), vsync: this), // vsync 默认属性和参数
      new NavigationIconView(icon: new Icon(Icons.all_inclusive), title: new Text("想法"), vsync: this),
      new NavigationIconView(icon: new Icon(Icons.add_shopping_cart), title: new Text("市场"), vsync: this),
    ];

    // 给每一个按钮区域加上监听
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    // 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
    ];
    _currentPage = _pageList[_currentIndex];

  }
  @override
  Widget build(BuildContext context) {

    // 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) => navigationIconView.item)
          .toList(),  // 添加 icon 按钮
      currentIndex: _currentIndex,  // 当前点击的索引值
      type: BottomNavigationBarType.fixed,    // 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index){   // 添加点击事件
        setState((){    // 点击之后，需要触发的逻辑事件
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return Scaffold(
      body: new Center(
          child: _currentPage   // 动态的展示我们当前的页面
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
