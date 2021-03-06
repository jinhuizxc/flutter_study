import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/eventbus_page.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/provider_page.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/sqflite.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/url_launch.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/webview_flutter.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/demo/flutter_webview_plugin.dart';
import 'package:flutter_study/sample/flutter_study_app/ui/pages/home/home_page.dart';

// app的首页
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppHomePage();
});

//WebView（flutter_webview_plugin）
var webViewPluginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url']?.first;
  String title = params['title'].first;
  return WebViewPluginPage(url: url, title: title);
});

//WebView（flutter官方插件）
var flutterWebViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url']?.first;
  String title = params['title']?.first;
  return FlutterWebView(url: url, barTitle: title);
});

// eventbus事件总线
var eventBusHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EventBusPage();
});

//provider状态管理
var providerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProviderDemoPage();
});

// sqflite数据库
var sqfliteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SqflitePage();
  },
);

//url channel
var urlLauncherHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return UrlLauncherDemo();
    });
