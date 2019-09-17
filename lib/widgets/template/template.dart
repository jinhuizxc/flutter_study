import 'package:flutter/material.dart';

/*
 * 模板
 */
class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '模板',
      home: Scaffold(
        appBar: AppBar(
          title: Text('模板'),
        ),
        body: Center(),
      ),
    );
  }
}
