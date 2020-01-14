import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

/*
 * 状态管理
 *
 * ChangeNotifierProvider
 *
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

      // test下
//      bottomNavigationBar: BottomNavigationBarExample(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Fluttertoast.showToast(msg: 'onPressed');
//        },
//        child: Icon(Icons.add),
//      ),

      // TODO provider绑定数据
      body: ChangeNotifierProvider<BottomNavigationBarProvider>(
          child: BottomNavigationBarExample1(),
          builder: (BuildContext context) => BottomNavigationBarProvider()),
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
//  var tabIcons = [Icons.home, Icons.shopping_cart, Icons.person];

  // 当前下标
  var _currentIndex = 0;

  // 显示底部tab菜单
  List<BottomNavigationBarItem> _tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text('商城'), icon: Icon(Icons.shopping_cart)),
    BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.person)),
  ];

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
//      backgroundColor: Colors.black,  // 设置tab的背景颜色，type为fixed有效
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        child: Text(
          '首页',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        color: Colors.amber,
      ),
    ));
  }
}

// 新闻
class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "新闻",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.blue,
        ),
      ),
    );
    ;
  }
}

// 我的
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child:
              Text('我的', style: TextStyle(color: Colors.white, fontSize: 30)),
          color: Colors.cyan,
        ),
      ),
    );
  }
}

/*************************Provider状态管理***********************************/
class BottomNavigationBarExample1 extends StatefulWidget {
  @override
  _BottomNavigationBarExample1State createState() =>
      _BottomNavigationBarExample1State();
}

class _BottomNavigationBarExample1State
    extends State<BottomNavigationBarExample1> {
  var currentPage = [
    HomePage(),
    NewsPage(),
    MyPage(),
  ];

  // 显示底部tab菜单
  List<BottomNavigationBarItem> _tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text('新闻'), icon: Icon(Icons.fiber_new)),
    BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.person)),
  ];

  @override
  Widget build(BuildContext context) {
    // provider获取数据
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentPage[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          // 获取当前index
          currentIndex: provider.currentIndex,
          // 设置当前index
          onTap: (index) {
            provider.currentIndex = index;
          },
          items: _tabItems),
    );
  }
}
