import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Container组件',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Container组件'),
          ),
          // Center使子控件居中显示
          body: Center(
            //父容器
            child: Container(
              // BoxDecoration指定了颜色的话这里就不能设置颜色
//              color: Colors.blueAccent,
              width: 200.0,
              height: 200.0,
              //内边距
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
              //边框装饰
              decoration: BoxDecoration(
                color: Colors.red,
                //边框
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 10.0, //边框粗细
                ),
                //边框弧度
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                image: DecorationImage(image: AssetImage('assets/images/cat.jpeg')),
              ),
              //子容器
              /*child: Container(
                color: Colors.green,
                margin: EdgeInsets.all(10.0),//外边距
              ),*/
            ),
          ),
        ));
  }
}
