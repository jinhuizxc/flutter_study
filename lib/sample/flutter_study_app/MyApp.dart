import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/routers/application.dart';
import 'package:flutter_study/routers/routers.dart';
import 'package:flutter_study/sample/flutter_study_app/res/colors.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/pages/transition_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/events.dart';

/*
 * flutter_study_app
 * https://github.com/ChessLuo/flutter_study_app
 *
 * 用到的库:
 * Router: https://github.com/theyakka/fluro
 */
class FlutterStudyApp extends StatefulWidget {

  FlutterStudyApp() {
    // 初始化路由
    final router = new Router();
    RoutesConstant.configureRoutes(router);
    Application.router = router;
  }

  @override
  _FlutterStudyAppState createState() => _FlutterStudyAppState();
}

class _FlutterStudyAppState extends State<FlutterStudyApp> {

  Color _primaryColor;
  // 需要导包 import 'dart:async';
  StreamSubscription _colorSubscription;


  @override
  void initState() {
    super.initState();
    _setThemeColor();
    // 订阅eventbus
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event){
      print("eventColor:" + event.colorStr);  // eventColor: #568958
      // 缓存主题色
      _cacheColor(event.colorStr);
      Color color = AppColors.getColor(event.colorStr);
      setState(() {
        _primaryColor = color;
      });
    });

  }

  @override
  void dispose() {
    //取消订阅
    _colorSubscription.cancel();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterStudyApp',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: TransitionPage(),
      onGenerateRoute: Application.router.generator,
    );
  }

  // 设置主题色，异步
  void _setThemeColor() async{
    String cacheColorStr = await _getCacheColor('themeColorStr');
    setState(() {
      _primaryColor = AppColors.getColor(cacheColorStr);
    });
  }

  void _cacheColor(String colorStr) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('themeColorStr', colorStr);
  }

  Future<String> _getCacheColor(String colorKey) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String colorStr = sp.getString(colorKey);
    return colorStr;
  }
}
