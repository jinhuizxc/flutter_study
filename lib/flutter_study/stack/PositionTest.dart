import 'package:flutter/material.dart';

/*
 * flutter——Positioned组件，定位组件的设置
 * https://blog.csdn.net/whqwjb/article/details/87890799
 *
 * Flutter入门学习--(16)布局定位控件Positioned
 *
 * Positioned()用在Stack()组件中
 * Positioned组件的属性
 * bottom: 距离层叠组件下边的距离
 * left：距离层叠组件左边的距离
 * top：距离层叠组件上边的距离
 * right：距离层叠组件右边的距离
 * width: 层叠定位组件的宽度
 * height: 层叠定位组件的高度
 *
 * Positioned控件主要用来设置绝对布局，必须配合Stack控件来使用，
 * Positioned控件 通过设置left和top属性可以设置控件的绝对位置
*
*/

class PositionedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 定义Stack()组件
    var stack_pos = new Stack(
      children: <Widget>[
        // 设置一个圆形组件
        CircleAvatar(
          backgroundColor: Colors.brown,
          radius: 100.0, // 圆的半径
        ),
        Positioned(
          child: Text(
            '头部文字',
            style: TextStyle(color: Colors.red),
          ),
          top: 10.0,
          left: 50.0,
        ),
        Positioned(
          //设置子元素
          child: Text("底部文字", style: TextStyle(color: Colors.red)),
          //设置定位，
          bottom: 10.0,
          right: 50.0,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Positioned布局控件'),
      ),
      body: new Column(
        children: <Widget>[
          Container(
            child: stack_pos,
          ),
          // 设置图片
          Stack(
            children: <Widget>[
              Image.network(
                  'http://www.people.com.cn/mediafile/pic/20150119/47/8293839320385270859.jpg'),
              // Positioned
              new Positioned(
                child: Text("我的当前位置", style: new TextStyle(color: Colors.red)),
                left: 65,
                top: 5,
              )
            ],
          )
        ],
      ),
    );
  }
}
