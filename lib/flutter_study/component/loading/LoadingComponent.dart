import 'dart:ui';

import 'package:flutter/material.dart';

// loading组件
/*class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
            SizedBox(height: 20.0),
            Text('正在加载中...')
          ],
        ),
      ),
    );
  }
}*/

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: window.physicalSize.height,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
            new Container(
                padding: EdgeInsets.only(top: 10.0), child: new Text("正在加载")),
          ],
        ),
      ),
    );
  }
}

