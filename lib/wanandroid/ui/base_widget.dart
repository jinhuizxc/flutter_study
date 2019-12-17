import 'package:flutter/material.dart';
/// 封装一个通用的Widget
abstract class BaseWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;
  @override
  State<StatefulWidget> createState(){
    baseWidgetState = attachState();
    return baseWidgetState;
  }

  BaseWidgetState attachState();

}



abstract class BaseWidgetState<T extends BaseWidget> extends State<T> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}


