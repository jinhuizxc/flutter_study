import 'package:flutter/material.dart';

/*
 * 对话框
 */
class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog组件示例'),
        ),
        body: Center(
          //添加对话框
          child: AlertDialog(
            // 设置阴影
            elevation: 5.0,
            //对话框标题
            title: Text('提示！'),
//            titlePadding: EdgeInsets.all(10.0),
            //对话框内容部分
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除?'),
                  Text('一旦删除数据不可恢复！'),
                ],
              ),
            ),
            //对话框操作按钮
            actions: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('确定'),
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
