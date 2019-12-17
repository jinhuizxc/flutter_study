import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/utils/utils.dart';
import 'package:flutter_study/wanandroid/ui/drawer_screen.dart';
import 'package:flutter_study/wanandroid/ui/home_screen.dart';
import 'package:flutter_study/wanandroid/ui/hot_word_screen.dart';
import 'package:flutter_study/wanandroid/ui/project_screen.dart';
import 'package:flutter_study/wanandroid/ui/share_article_screen.dart';
import 'package:flutter_study/wanandroid/ui/square_screen.dart';
import 'package:flutter_study/wanandroid/ui/system_screen.dart';
import 'package:flutter_study/wanandroid/ui/wechat_screen.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';

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

  // TODO final 与static

  /// 五个Tabs的内容
  var pages = <Widget>[
    HomeScreen(),
    SquareScreen(),
    WeChatScreen(),
    SystemScreen(),
    ProjectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: DrawerScreen(), // 侧滑页面
        appBar: AppBar(
          title: new Text(bottomBarTitles[_currentIndex]), // 标题
          bottom: null,
          elevation: 0,
          actions: <Widget>[
            // 标题栏右上角+和搜索
            IconButton(
                icon: _currentIndex == 1 ? Icon(Icons.add) : Icon(Icons.search),
                onPressed: () {
                  if (_currentIndex == 1) {
                    RouteUtil.push(context, ShareArticleScreen()); // 跳到分享
                  } else {
                    RouteUtil.push(context, HotWordScreen()); // 跳到搜索
                  }
                })
          ],
        ),
        // TODO PageView的用法
        body: PageView.builder(
            itemCount: pages.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) => pages[index]),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: buildImage(0, "ic_home"),
                title: Text(bottomBarTitles[0])),
            BottomNavigationBarItem(
                icon: buildImage(1, "ic_square_line"),
                title: Text(bottomBarTitles[1])),
            BottomNavigationBarItem(
                icon: buildImage(2, "ic_wechat"),
                title: Text(bottomBarTitles[2])),
            BottomNavigationBarItem(
                icon: buildImage(3, "ic_system"),
                title: Text(bottomBarTitles[3])),
            BottomNavigationBarItem(
                icon: buildImage(4, "ic_project"),
                title: Text(bottomBarTitles[4])),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTabPress,
        ),
      ),
      onWillPop: _onWillPop, // onWillPop 就表示当前页面将退出
    );
  }

  @override
  bool get wantKeepAlive => true;

  // onWillPop 就表示当前页面将退出
  Future<bool> _onWillPop() {
    return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text('提示'),
                  content: new Text('确定退出应用？'),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: new Text('在看一会',
                            style: TextStyle(color: Colors.cyan))),
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child:
                          new Text('退出', style: TextStyle(color: Colors.cyan)),
                    ),
                  ],
                )) ??
        false;
  }

  Widget buildImage(int index, String iconPath) {
    return Image.asset(
      Utils.getImgPath(iconPath),
      width: 22,
      height: 22,
      color: _currentIndex == index
          ? Theme.of(context).primaryColor
          : Colors.grey[600],
    );
  }

  /// 点击tab切换页面
  void _onTabPress(int index) {
    _pageController.jumpToPage(index);
  }
}
