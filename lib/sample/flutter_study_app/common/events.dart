import 'package:event_bus/event_bus.dart';

// 初始化eventbus
EventBus eventBus = new EventBus();

// EventBus 修改主题色
class ThemeColorEvent {
  String colorStr;

  ThemeColorEvent(this.colorStr);
}
