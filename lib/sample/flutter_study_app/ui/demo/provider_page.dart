import 'package:flutter/material.dart';

/*
 * 状态管理
 */
class ProviderDemoPage extends StatefulWidget {
  @override
  _ProviderDemoPageState createState() => _ProviderDemoPageState();
}

class _ProviderDemoPageState extends State<ProviderDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider状态管理"),
        centerTitle: true,
      ),
      // provider绑定数据
      // TODO 首先创建底部widget;
      body: BottomNavigationBarExample(),
    );
  }
}

// 创建底部菜单view
class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  var tabTitles = ['首页', '商城', '我的'];
  var tabIcons = [Icons.home, Icons.shopping_cart, Icons.person];

  // 当前下标
  var _currentIndex = 0;

  // 显示底部tab菜单
  List<BottomNavigationBarItem> _tabItems = <BottomNavigationBarItem>[];

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        // 点击tab,根据下标切换页面
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _tabItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('首页'),
    );
  }
}

// 新闻
class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('新闻'),
    );
  }
}

// 我的
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}
