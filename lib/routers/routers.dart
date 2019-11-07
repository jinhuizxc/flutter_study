import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/routers/router_handler.dart';

/*
 * 路由导航的常量
 */
class RoutesConstant {
  static String webViewPage = "/webview";

  // FlutterStudyApp
  static String root = "/";
  static String transitionPage = "/transition";
  static String homePage = "/home";

  static String sqflitePage = "/sqflite";
  static String eventBusPage = "/eventBus";
  static String fileZipPage = "/fileZip";
  static String webViewPlginPage = "/webViewPlgin";
  static String flutterWebViewPage = "/flutterWebView";
  static String providerPage = "/provider";
  static String sharedPreferences = "/sharedPreferences";
  static String flutterChannel = "/flutterChannel";
  static String urlLauncher = "/urlLauncher";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      // ignore: missing_return
      handlerFunc: (BuildContext context, Map<String, List<String>> params){

      });

    router.define(homePage, handler: homeHandler);
    router.define(webViewPlginPage, handler: webViewPluginHandler);
    router.define(flutterWebViewPage, handler: flutterWebViewHandler);
    router.define(eventBusPage, handler: eventBusHandler);
    router.define(eventBusPage, handler: providerHandler);

  }
}
