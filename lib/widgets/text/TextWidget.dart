import 'package:flutter/material.dart';

/*
 * 展示不同的文本样式
 */
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '文本组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('文本组件'),
        ),
        //垂直布局
        body: Column(
          children: <Widget>[
            //文本组件
            Text(
              '文本一: 红色字体+黑色删除线+18号+斜体+粗体',
              style: TextStyle(
                //字体颜色
                color: Colors.red,
                //文本装饰器(删除线lineThrough)
                decoration: TextDecoration.lineThrough,
                //文本装饰器颜色(删除线颜色)
                decorationColor: const Color(0xff000000),
                //字体大小
                fontSize: 18.0,
                //字体样式 是否斜体
                fontStyle: FontStyle.italic,
                //字体粗细
                fontWeight: FontWeight.bold,
                //文字间距
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '文本二: 橙色+下划线+24号',
              style: TextStyle(
                color: const Color(0xffff9900),
                decoration: TextDecoration.underline,
                fontSize: 24.0,
              ),
            ),
            Text(
              '文本三: 上划线+虚线+23号',
              style: TextStyle(
                // 虚线
                decoration: TextDecoration.overline,
                decorationStyle: TextDecorationStyle.dashed,
                fontSize: 23.0,
                //字体样式
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              '文本四: 23号+斜体+加粗+字间距6',
              style: TextStyle(
                fontSize: 23.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
