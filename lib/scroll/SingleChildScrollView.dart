// SingleChildScrollView  有一个子widget的可滚动的widget，子内容超过父容器时可以滚动。

import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class MySingleChildScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Flutter Code Sample',
      builder: (BuildContext context, Widget navigator) {
        return MyStatelessWidget();
      },
      color: const Color(0xffffffff),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}