import 'package:flutter/material.dart';

class PageUtil{

  void pushTo(BuildContext context, Widget widget){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      //_下划线是啥，原本是BuildContext context
      return widget;
    }));
  }

  void pushWithResult(BuildContext context, Widget widget, Function callBack){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return widget;
    })).then((result){
      callBack(result);
    });
  }

}