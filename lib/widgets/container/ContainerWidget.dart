import 'package:flutter/material.dart';

/*
 * 容器组件示例
 *  // TODO 示例1 ： Center使子控件居中显示
 *  // TODO 示例2
 */
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Container组件',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Container组件'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                // TODO 示例1 ： Center使子控件居中显示
                //父容器
                widget1(),
                // TODO 示例2
                widget2(),
              ],
            ),
          ),
        ));
  }

  Widget widget2() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 200.0,
      height: 200.0,
//              color: Colors.blueAccent,
      //添加边框装饰效果
      decoration: BoxDecoration(
        color: Colors.red,
        //设置上下左右四个边框样式
        border: Border.all(
          color: Colors.grey, //边框颜色
          width: 8.0, //边框粗细
        ),
        borderRadius:
            const BorderRadius.all(const Radius.circular(10.0)), //边框的弧度
      ),
      child: Text(
        'Flutter',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget widget1() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      // BoxDecoration指定了颜色的话这里就不能设置颜色
//              color: Colors.blueAccent,
      width: 200.0,
      height: 200.0,
      //内边距
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
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
      child: Container(
        color: Colors.green,
        margin: EdgeInsets.all(10.0), //外边距
      ),
    );
  }
}
