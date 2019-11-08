import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_wxread/navigator/tab_navigator.dart';

/*
 * 微信读书App
 * https://github.com/wuchao226/flutter_beauty
 */
class FlutterWxReadApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter微信读书',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: TabNavigator(),
    );
  }

}

