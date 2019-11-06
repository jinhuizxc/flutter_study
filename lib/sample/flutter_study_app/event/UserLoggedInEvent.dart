
/*
 * 1. Create an Event Bus
 *
 * import 'package:event_bus/event_bus.dart';
 * EventBus eventBus = EventBus();
 *
 * 注意: 默认构造函数将创建异步事件总线。要创建同步总线，必须提供可选的sync: true属性。
 *
 * Define Events
 * Any Dart class can be used as an event.
 */
//class UserLoggedInEvent {
//  User user;
//
//  UserLoggedInEvent(this.user);
//}
//
//class NewOrderEvent {
//  Order order;
//
//  NewOrderEvent(this.order);
//}