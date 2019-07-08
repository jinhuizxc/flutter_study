
import 'package:flutter/material.dart';
import 'package:flutter_study/http/dio/login/login.dart';

/*
 * dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器等...
 * https://github.com/flutterchina/dio/blob/master/README-ZH.md
 *
 * Flutter之dio网络请求--生成bean
 * https://blog.csdn.net/O_time/article/details/86018210
 *
 * Flutter 网络请求的三种简单实现
 * https://blog.csdn.net/weixin_33955681/article/details/88294968
 *
 * 快速生成bean:
 * 为了便利使用 json_serializable库
 *
 * https://caijinglong.github.io/json2dart/index_ch.html
 * json:
 * {"data":{"chapterTops":[], "collectIds":[], "email":"","icon":"","id":15416,"password":"","token":"","type":0,"username":"123213","errorCode":0,"errorMsg":""}}
 *
 * 生成dart文件直接拷贝过去，然后在项目的根目录
 * flutter packages pub run build_runner build
 *
 * 玩安卓Flutter版【开发中】，非常新手适合学习，代码不多、注释多
 * https://github.com/yechaoa/wanandroid_flutter
 *
 */
class DioTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Login(),
    );
  }

}