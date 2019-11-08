
import 'package:flutter/material.dart';

/*
 * 底部按钮状态监听
 */
class BottomNavigationBarProvider with ChangeNotifier{

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();  // 通知监听
  }


}