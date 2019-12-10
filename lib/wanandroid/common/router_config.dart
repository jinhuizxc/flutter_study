import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/ui/home_screen.dart';
import 'package:flutter_study/wanandroid/ui/hot_word_screen.dart';
import 'package:flutter_study/wanandroid/ui/knowledge_tree_screen.dart';
import 'package:flutter_study/wanandroid/ui/login_screen.dart';
import 'package:flutter_study/wanandroid/ui/navigator_screen.dart';
import 'package:flutter_study/wanandroid/ui/project_screen.dart';
import 'package:flutter_study/wanandroid/ui/register_screen.dart';
import 'package:flutter_study/wanandroid/ui/splash_screen.dart';
import 'package:flutter_study/wanandroid/ui/todo_screen.dart';
import 'package:flutter_study/wanandroid/ui/wechat_screen.dart';

/// 存放路由的配置
class RouterName{

  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';
  static const String main = 'main';
  static const String home = 'home';
  static const String knowledge_tree = 'knowledge_tree';
  static const String navigation = 'navigation';
  static const String we_chat = 'we_chat';
  static const String project = 'project';
  static const String hot_word = 'hot_word';
  static const String hot_result = 'hot_result';
  static const String web_view = 'web_view';
  static const String todo = 'todo';
  static const String todo_add = 'todo_add';

}

class Router{
  static Map<String, WidgetBuilder> generateRoute(){
    Map<String, WidgetBuilder> routers = {
      RouterName.splash: (context)=> new SplashScreen(),
      RouterName.login: (context) => new LoginScreen(),
      RouterName.register: (context) => new RegisterScreen(),
      RouterName.home: (context) => new HomeScreen(),
      RouterName.knowledge_tree: (context) => new KnowledgeTreeScreen(),
      RouterName.navigation: (context) => new NavigationScreen(),
      RouterName.we_chat: (context) => new WeChatScreen(),
      RouterName.project: (context) => new ProjectScreen(),
      RouterName.hot_word: (context) => new HotWordScreen(),
      // RouterName.hot_result: (context) => new HotResultScreen(),
      // RouterName.web_view: (context) => new WebViewScreen(),
      RouterName.todo: (context) => new TodoScreen(),
      // RouterName.todo_add: (context) => new TodoAddScreen(),
    };
    return routers;
  }
}