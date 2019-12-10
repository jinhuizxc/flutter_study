import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast 简单封装
class ToastUtil {
  static show({
    @required String msg,
    Toast toastLength = Toast.LENGTH_SHORT,
    int timeInSecForIos = 1,
    Color backgroundColor = Colours.transparent_ba,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        timeInSecForIos: timeInSecForIos,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}
