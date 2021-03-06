// 单例模式么！！！
import 'package:dio/dio.dart';
import 'package:flutter_study/wanandroid/data/model/user_model.dart';
import 'package:flutter_study/wanandroid/utils/sp_util.dart';

import 'common.dart';

class User {
  static final User singleton = User._internal();

  factory User() {
    return singleton;
  }


  User._internal();

  List<String> cookie;
  String userName;

  // TODO 从接口返回, 保存用户信息

  /// 获取本地用户信息
  Future<Null> getUserInfo() async {
    List<String> cookies = SPUtil.getStringList(Constants.COOKIES_KEY);
    if (cookies != null) {
      cookie = cookies;
    }

    String username = SPUtil.getString(Constants.USERNAME_KEY);
    if(username != null){
      userName = username;
    }
  }


  // 保存登录的用户信息
  void saveUserInfo(UserModel _userModel, Response response) async{
    List<String> cookies = response.headers['set-cookie'];
    cookie = cookies;
    userName = _userModel.data.username;
    saveInfo();
  }

  /// 保存用户信息到本地
  saveInfo() async {
    SPUtil.putStringList(Constants.COOKIES_KEY, cookie);
    SPUtil.putString(Constants.USERNAME_KEY, userName);
  }

  /// 清空本地用户信息
  void clearUserInfo() {
    cookie = null;
    userName = null;
    SPUtil.remove(Constants.COOKIES_KEY);
    SPUtil.remove(Constants.USERNAME_KEY);
  }
}
