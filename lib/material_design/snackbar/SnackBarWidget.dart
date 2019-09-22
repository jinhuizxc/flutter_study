import 'package:flutter/material.dart';

/*
 * SnackBar
 */
class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SnackBar示例'),
        leading: BackButton(),
      ),
      body: Center(
        child: Text(
          'SnackBar示例',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      //FAB按钮的设置、位置在Scaffold控件中
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            //点击回调事件 弹出一句提示语句
            Scaffold.of(context).showSnackBar(new SnackBar(
              //提示信息内容部分
              content: Text('显示SnackBar'),
            ));
          },
          // 设置FAB的形状
          shape: CircleBorder(),
        );
      }),
      // //居中放置 位置可以设置成左中右
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
