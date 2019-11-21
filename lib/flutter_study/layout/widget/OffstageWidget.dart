import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * Offstage控制是否显示组件
 */
class OffstageWidget extends StatefulWidget {
  final String title;

  OffstageWidget({Key key, this.title}) : super(key: key);

  @override
  _OffstageWidgetState createState() => _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> {
  //状态控制是否显示文本组件
  bool offstage = false;  // false 默认显示出来，true的话就是不显示

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Offstage(
          offstage: offstage, //控制是否显示
          child: Text('我出来了！',
              style: TextStyle(
                fontSize: 36.0,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this.offstage = !offstage;
          });
        },
        tooltip: "显示隐藏",
        child: Icon(Icons.flip),
      ),
    );
  }
}
