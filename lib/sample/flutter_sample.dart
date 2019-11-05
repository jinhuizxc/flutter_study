import 'package:flutter/material.dart';

import 'login_page/ui/login_page.dart';


/*
 * 这个页面将显示看到的好的页面或者好的效果，在这里进行绘制
 */
class FlutterSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // 登录页面
      LoginPage(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterSample'),
      ),
      // ListView学习
      body: ListView(
        children: list.map((widget) {
          return ListTile(
            title: Text(widget.toString()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => widget),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
