import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';

class Constant {
  static const String key_guide = 'key_guide';
  static const String phone = 'phone';
  static const String access_Token = 'accessToken';
  static const String refresh_Token = 'refreshToken';
}

/*
 * 定义全局的Application
 */
class Application {

  static Router router;
  static EventBus eventBus;

}

