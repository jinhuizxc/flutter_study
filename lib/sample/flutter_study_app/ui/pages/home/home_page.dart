import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/pages/drawer_page.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/pages/home/home_list.dart';

/*
 * 首页
 */
class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        centerTitle: true,
        title: Text('首页', style: TextStyle(color: Colors.white),),
      ),
      body: HomeList(),
      drawer: Drawer(
        // 侧滑页面
        child: DrawerPage(),
      ),
    );
  }
}
