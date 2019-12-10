import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_study/wanandroid/common/router_config.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/my_app.dart';
import 'package:flutter_study/wanandroid/net/dio_manager.dart';
import 'package:flutter_study/wanandroid/utils/sp_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';

/// WanAndroid 统一接口返回格式错误检测
class ErrorInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onError(DioError err) async {
    String errorMsg = DioManager.handleError(err);
    ToastUtil.show(msg: errorMsg);
    return err;
  }

  @override
  Future onResponse(Response response) async {
    var data = response.data;
    if (data is String) {
      data = json.decode(data); // 解码
    }

    if (data is Map) {
      // 表示如果data['errorCode']为空的话把 0赋值给errorCode
      int errorCode = data['errorCode'] ?? 0;
      String errorMsg = data['errorMsg']??'请求失败[$errorCode]';
      if(errorCode == 0){
        return response;
      }else if(errorCode == -1001/*未登录错误码*/){
        ///  清除用户信息
        User().clearUserInfo();
        dio.clear(); // 调用拦截器的clear()方法来清空等待队列。
        SPUtil.clear();
        goLogin();
        return dio.reject(errorMsg);  // 完成和终止请求/响应
      }else{
        ToastUtil.show(msg: errorMsg);
        return dio.reject(errorMsg);  // 完成和终止请求/响应
      }
    }

    return response;
  }

  void goLogin() {
    /// 在拿不到context的地方通过navigatorKey进行路由跳转：
    /// https://stackoverflow.com/questions/52962112/how-to-navigate-without-context-in-flutter-app
    navigatorKey.currentState.pushNamed(RouterName.login);
  }


}