import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/stack/PositionTest.dart';
import 'package:flutter_study/flutter_study/stack/indexed_stack.dart';
import 'package:flutter_study/flutter_study/stack/stack_align.dart';
import 'package:flutter_study/flutter_study/stack/stack_position.dart';
import 'package:flutter_study/flutter_study/stack/stack_test.dart';

import 'NavigatorTest.dart';
import 'NavigatorTest1.dart';
import 'NavigatorTest2.dart';
import 'NavigatorTest3.dart';
import 'NavigatorTest4.dart';
import 'NavigatorTest5.dart';

class RouterStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('路由和导航组件学习'),
        ),
        body: MainHome(),
    );
  }
}

class MainHome extends StatelessWidget {
  List<Widget> list = <Widget>[
  NavigatorTest(),
  NavigatorTest1(),
  NavigatorTest2(),
  NavigatorTest3(),
  NavigatorTest4(),
  NavigatorTest5(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((widget) {
        return ListTile(
          title: Text(widget.toString()),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => widget));
          },
        );
      }).toList(),
    );
  }
}
