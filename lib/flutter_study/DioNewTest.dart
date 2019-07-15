import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_study/flutter_study/HomePage.dart';
import 'package:flutter_study/flutter_study/MinePage.dart';

/*
 * Flutter dio结合json_serializable请求数据并解析Demo
 * https://www.jianshu.com/p/e010041f0ec0
 */

final ThemeData kIOSTheme = ThemeData(
  primaryIconTheme: const IconThemeData(color: Colors.white),
  primarySwatch: Colors.green,
  primaryColor: Colors.green,
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primaryIconTheme: const IconThemeData(color: Colors.white),
  primarySwatch: Colors.blueGrey,
  primaryColor: Colors.blueGrey,
  accentColor: Colors.orangeAccent,
  fontFamily: 'HYQiHei-30F',
  textTheme: TextTheme()
);


class DioNewTest extends StatefulWidget {
  @override
  _DioNewTestState createState() => _DioNewTestState();
}

class _DioNewTestState extends State<DioNewTest> {
  int _currentIndex = 0;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;
  List<BottomNavigationBarItem> _navigationItems;

  // 设置标题
  var appBatTitle = ['首页', '我的'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text(appBatTitle[0])),
      BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity), title: Text(appBatTitle[1]))
    ];

    _pageList = <StatefulWidget>[HomePage(), MinePage()];

    _currentPage = _pageList[_currentIndex];

  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavBar =
        BottomNavigationBar(items: _navigationItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // 点击事件
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _currentPage = _pageList[_currentIndex];
          });
        },);


    return MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      home: Scaffold(
        appBar: AppBar(
          title: new Text(appBatTitle[_currentIndex]),
        ),
        body: Center(child: _currentPage),
        bottomNavigationBar: bottomNavBar,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}
