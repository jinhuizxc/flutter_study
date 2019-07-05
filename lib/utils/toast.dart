import 'package:oktoast/oktoast.dart';

// toast工具类
class Toast{

  // 显示toast
  static show(String msg, {duration = 2000}){
    showToast(msg, duration: Duration(milliseconds: duration));
  }

  // 取消toast
  static cancelToast(){
    dismissAllToast();
  }

}