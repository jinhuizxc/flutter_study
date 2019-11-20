import 'package:flutter/material.dart';

/*
 * AlertDialog组件示例
 *
 * AlertDialog:
 * const AlertDialog({
    Key key,
    this.title,    // 标题
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,       // 对话框操作按钮
    this.backgroundColor,
    this.elevation,    // 设置阴影
    this.semanticLabel,
    this.shape,
  }) : assert(contentPadding != null),
       super(key: key);

 */
class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
