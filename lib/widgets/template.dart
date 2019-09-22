import 'package:flutter/material.dart';

/*
 * 模板
 */
class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('组件'),
        ),
        body: Center(),
      ),
    );
  }
}
