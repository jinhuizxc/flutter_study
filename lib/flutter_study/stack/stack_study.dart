import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/stack/PositionTest.dart';
import 'package:flutter_study/flutter_study/stack/indexed_stack.dart';
import 'package:flutter_study/flutter_study/stack/stack_align.dart';
import 'package:flutter_study/flutter_study/stack/stack_position.dart';
import 'package:flutter_study/flutter_study/stack/stack_test.dart';

class StackStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack组件学习'),
        ),
        body: MainHome(),
    );
  }
}

class MainHome extends StatelessWidget {
  List<Widget> list = <Widget>[
    // StackTest例子
    StackTest(),
    // Positioned组件
    PositionedTest(),
    StackAlign(),
    StackPositioned(),
    // IndexedStackTest
    IndexedStackTest(),
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
