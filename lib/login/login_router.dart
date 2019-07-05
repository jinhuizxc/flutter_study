
import 'package:fluro/fluro.dart';
import 'package:flutter_study/login/login_page.dart';
import 'package:flutter_study/routers/router_init.dart';

// 子类继承父类
class LoginRouter implements IRouterProvider{

  static String loginPage = "/login";
  static String registerPage = "/login/register";
  static String smsLoginPage = "/login/smsLogin";
  static String resetPasswordPage = "/login/resetPassword";
  static String updatePasswordPage = "/login/updatePassword";

  @override
  void initRouter(Router router) {

    router.define(loginPage, handler: Handler(handlerFunc: (context, params)=> Login()));
  }

}