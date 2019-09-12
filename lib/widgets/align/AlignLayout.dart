import 'package:flutter/material.dart';

/*
 * Align对齐布局示例
 */
class AlignLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Align对齐布局示例',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Align对齐布局示例'),
        ),
        // Stack组件
        body: Stack(
          children: <Widget>[
            //左上角
            Align(
              //对齐属性 确定位置
              alignment:FractionalOffset(0.0, 0.0),
              //添加图片
              child: Image.asset('assets/images/1.jpeg',width: 128.0,height: 128.0,),
            ),
            //右上角
            Align(
              alignment: FractionalOffset(1.0,0.0),
              child: Image.asset('assets/images/2.jpeg',width: 128.0,height: 128.0,),
            ),
            //水平垂直方向居中
            Align(
              alignment: FractionalOffset.center,
              child: Image.asset('assets/images/3.jpeg',width: 128.0,height: 128.0,),
            ),
            //左下角
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: Image.asset('assets/images/4.jpeg',width: 128.0,height: 128.0,),
            ),
            //右下角
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Image.asset('assets/images/5.jpeg',width: 128.0,height: 128.0,),
            ),
          ],
        ),
      ),
    );
  }
}
