import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_wxread/pages/content_page.dart';

/*
 *
 * 底部导航栏
 *
 * 初步实现
 * body: Container(
        child: Center(
          child: Text('你选中了${_currentIndex}项'),
        ),
      ),
 */
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;
  int _currentIndex = 0;

  List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.grey,
  ];

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 主体body
      body: Container(
        child: Center(
          child: Text('你选中了${_currentIndex}项'),
        ),
      ),
//    body: Container(
//      // 盒子装饰器
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          colors: [
//            Color(0xffedeef0),
//            Color(0xffe6e7ed),  // 0xffe6e7ed   0xff895623
//          ],
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter,
//        ),
//      ),
//      child: ContentPage(
//
//      ),
//    ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            //修改状态
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem(Icons.folder, "本周", 0),
            _bottomItem(Icons.explore, "分享", 1),
            _bottomItem(Icons.donut_small, "免费", 2),
            _bottomItem(Icons.person, "我的", 3),
          ]),
    );
  }

  // 封装底部Tab
  _bottomItem(IconData iconData, String title, int index) {
    return BottomNavigationBarItem(
      title: Text(
        title,
        style: TextStyle(
            color: index == _currentIndex ? _activeColor : _defaultColor),
      ),
      icon: Icon(
        iconData,
        color: _defaultColor,
      ),
      // 选中的颜色
      activeIcon: Icon(
        iconData,
        color: _activeColor,
      ),
    );
  }
}
