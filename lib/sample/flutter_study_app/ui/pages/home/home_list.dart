import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/routers/application.dart';
import 'package:flutter_study/routers/routers.dart';

/*
 * 首页listview
 */
class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List itemTitles = [
    'sqflite数据库',
    'eventbus事件总线',
    '文件解压缩',
    'WebView（flutter_webview_plugin）',
    'WebView（flutter官方插件）',
    'provider状态管理',
    'shared_preferences数据持久化',
    'Flutter Channel',
    'url_launcher',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _listItem(itemTitles[0], () {
            //sqflite数据库
            Application.router.navigateTo(context, RoutesConstant.sqflitePage,
                transition: TransitionType.fadeIn);
          }),
          _listItem(itemTitles[1], () {
            //eventbus事件总线
            Application.router.navigateTo(context, RoutesConstant.eventBusPage,
                transition: TransitionType.inFromRight);
          }),
          _listItem(itemTitles[3], (){
            Application.router.navigateTo(context,
                '${RoutesConstant.webViewPlginPage}?url=${Uri.encodeComponent('https://github.com/ChessLuo')}&title=flutter_webview_plugin',
                transition: TransitionType.native);
          }),
          _listItem(itemTitles[4], () {
            //WebView（flutter官方插件）
            Application.router.navigateTo(context,
                '${RoutesConstant.flutterWebViewPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=flutter_webview',
                transition: TransitionType.material);
          }),
          _listItem(itemTitles[5], () {
            //provider状态管理
            Application.router.navigateTo(context, RoutesConstant.providerPage,
                transition: TransitionType.cupertino);
          }),

        ],
      ),
    );
  }

  // Item入口View
  Widget _listItem(String itemTitle, Function onTap) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              bottom: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid))),
      child: ListTile(
        title: Text(itemTitle),
          trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
