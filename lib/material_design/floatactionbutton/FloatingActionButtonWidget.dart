import 'package:flutter/material.dart';

/*
 * FloatingActionButton示例
 */
class FloatingActionButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton示例'),
      ),
      body: Center(
        child: Text(
          'FloatingActionButton示例',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
//      floatingActionButton: FloatingActionButton(onPressed: null),
      // 点击异常: Scaffold.of() called with a context that does not contain a Scaffold.
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            //点击回调事件 弹出一句提示语句
            SnackBar snackbar = SnackBar(
                backgroundColor: Colors.blueAccent,
                content: Text('你点击了FloatingActionButton'));
            Scaffold.of(context).showSnackBar(snackbar);
          },
          child: const Icon(Icons.add),
          //提示信息 用户长按显示
          tooltip: '请点击FloatingActionButton',
          //前景色为白色
          foregroundColor: Colors.white,
          //背景色为蓝色
          backgroundColor: Colors.red,
          //未点击阴影值
          elevation: 7.0,
          //点击阴影值
          highlightElevation: 14.0,
          mini: false,
          //圆形边
          shape: CircleBorder(),
          isExtended: false,
        );
      }),
      // 位置: startTop: 左上 endTop: 右上 centerFloat: 底部居中 centerDocked: 底部居中靠下
      // endFloat: 右下
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
