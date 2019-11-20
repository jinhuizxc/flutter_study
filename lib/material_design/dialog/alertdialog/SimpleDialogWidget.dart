import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * SimpleDialog组件示例
 *
 * SimpleDialog:
 *  const SimpleDialog({
    Key key,
    this.title,
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.children,
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
  }) : assert(titlePadding != null),
       assert(contentPadding != null),
       super(key: key);

 * SimpleDialogOption:
 *  const SimpleDialogOption({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);
 *
 */
class SimpleDialogWidget extends StatelessWidget {

  static const String title1 = '第一行信息';
  static const String title2 = '第二行信息';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog组件示例'),
        ),
        body: Center(
          child: SimpleDialog(
            title: const Text('对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Fluttertoast.showToast(msg: title1);
                },
                child: const Text(title1),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Fluttertoast.showToast(msg: title2);
                },
                child: const Text(title2),
              ),
            ],
          ),
        ),
    );
  }
}
