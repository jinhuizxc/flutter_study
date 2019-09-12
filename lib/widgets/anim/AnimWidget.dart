import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/anim/ChartsAnimation.dart';
import 'package:flutter_study/widgets/anim/FontAnimation.dart';
import 'package:flutter_study/widgets/anim/HeroAnimation.dart';
import 'package:flutter_study/widgets/anim/MaskAnimation.dart';
import 'package:flutter_study/widgets/anim/OpacityAnimation.dart';

import 'EasingAnimation.dart';
import 'ValueAnimation.dart';

/*
 * 动画示例
 */
class AnimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter动画示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }

  /*var mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    List<Widget> list = [
      FontAnimation(),
      EasingAnimation(),
      ValueAnimation(),
      MaskAnimation(),
      ChartsAnimation(),
      OpacityAnimation(),
      HeroAnimation(),
    ];
    return MaterialApp(
      title: 'Flutter动画示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Flutter动画示例'),
        ),
        //
        body: ListView(
          children: list.map((widget) {
            // ListTile列表瓦片
            return ListTile(
              title: Text(widget.toString()),
//              onLongPress: () {},
              onTap: () {
                // TODO 异常: Another exception was thrown: Navigator operation requested
                //  with a context that does not include a Navigator.
                Navigator.of(mContext).push(
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              // EdgeInsetsGeometry不懂用法
//              contentPadding: EdgeInsetsGeometry.lerp(a, b, t),
            );
          }).toList(),
        ),
      ),
    );
  }*/

}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      FontAnimation(),
      EasingAnimation(),
      ValueAnimation(),
      MaskAnimation(),
      ChartsAnimation(),
      OpacityAnimation(),
      HeroAnimation(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('动画示例'),
      ),
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

