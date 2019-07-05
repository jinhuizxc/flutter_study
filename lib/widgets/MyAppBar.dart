import 'package:flutter/material.dart';

// 封装app_bar
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;

  MyAppBar(
      {Key key,
      this.backgroundColor,
      this.title,
      this.centerTitle,
      this.backImg,
      this.actionName,
      this.onPressed,
      this.isBack})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  // 设置app_bar高度;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(48.0);
}
