import 'package:flutter/material.dart';

/*
 * OverflowBox溢出父容器显示
 */
class OverflowBoxWidget extends StatelessWidget {

  final String title;

  OverflowBoxWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverflowBox溢出父容器显示示例'),
      ),
      body: Container(
        color: Colors.green,
        width: 200.0,
        height: 200.0,
        padding: const EdgeInsets.all(30.0),  // 内边距
        child: OverflowBox(
          alignment: Alignment.topLeft,
          // 以左上角为锚点，向外扩张
          maxWidth: 400,
          maxHeight: 400,
          child: Container(
            color: Colors.blueGrey,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
