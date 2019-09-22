import 'package:flutter/material.dart';

/*
 * FlatButton-扁平按钮
 */
class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FlatButton组件'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          // TODO 图标用法 图标 + 文本组件
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.print,
                size: 35.0,
              ),
              label: Text(
                '默认按钮',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28.0,
                ),
              )),

          // 文本组件
          FlatButton(
            onPressed: () {
              print('按钮按下测试');
            },
            child: Text(
              'Success',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            // 按钮背景色
            color: Colors.green,
            // 按钮亮度
            colorBrightness: Brightness.dark,
            // 失效时的背景色
            disabledColor: Colors.grey,
            // 失效时的文本色
            disabledTextColor: Colors.red,
            // 文本颜色
            textColor: Colors.white,
            // 按钮主题 ButtonTheme ButtonThemeData ThemeData
            textTheme: ButtonTextTheme.normal,
            // 墨汁飞溅的颜色
            splashColor: Colors.blue,
            // 抗锯齿能力
            clipBehavior: Clip.antiAlias,
            padding:
                EdgeInsets.only(bottom: 5.0, top: 5.0, left: 20.0, right: 20.0),
            // 形状设置
//            shape: Border.all(
//              width: 2.0,
//              color: Colors.purple,
//              style: BorderStyle.solid,
//            ),
            shape: RoundedRectangleBorder(
                side: new BorderSide(
                  width: 2.0,
                  color: Colors.purple,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
          ),

          FlatButton(
            onPressed: () {
              print('按钮按下测试');
            },
            child: Text(
              'Error',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            // 按钮背景色
            color: Colors.red,
            // 按钮亮度
            colorBrightness: Brightness.dark,
            // 失效时的背景色
            disabledColor: Colors.grey,
            // 失效时的文本色
            disabledTextColor: Colors.red,
            // 文本颜色
            textColor: Colors.white,
            // 按钮主题 ButtonTheme ButtonThemeData ThemeData
            textTheme: ButtonTextTheme.normal,
            // 墨汁飞溅的颜色
            splashColor: Colors.blue,
            // 抗锯齿能力
            clipBehavior: Clip.antiAlias,
            padding:
                EdgeInsets.only(bottom: 5.0, top: 5.0, left: 20.0, right: 20.0),
            // 形状设置
//            shape: Border.all(
//              width: 2.0,
//              color: Colors.purple,
//              style: BorderStyle.solid,
//            ),
            shape: RoundedRectangleBorder(
                side: new BorderSide(
                  width: 2.0,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
          ),

          FlatButton(
            onPressed: () {
              print('按钮按下测试');
            },
            child: Text(
              '默认样式',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            // 按钮背景色
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
