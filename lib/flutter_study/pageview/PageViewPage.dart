import 'package:flutter/material.dart';

/*
 * 【Flutter学习】基本组件之基本滑动PageView组件
 * https://www.cnblogs.com/lxlx1798/p/11181295.html
 *
 * 一，概述

PageView 是一个滑动视图列表，它也是继承至 CustomScrollView 的。
二，构造函数

    类命构造函数（PageView）
        PageView　
            使用场景:创建一个可滚动列表
            构造函数　
            复制代码

              PageView({
                Key key,
                this.scrollDirection = Axis.horizontal,
                this.reverse = false,
                PageController controller,
                this.physics,
                this.pageSnapping = true,
                this.onPageChanged,
                List<Widget> children = const <Widget>[],
                this.dragStartBehavior = DragStartBehavior.start,
              }) : controller = controller ?? _defaultPageController,
                   childrenDelegate = SliverChildListDelegate(children),
                   super(key: key);

            复制代码
    命名构造函数
        PageView.builder
            使用场景:创建一个滚动列表，指定数量
            重要参数：

            typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

            * @required IndexedWidgetBuilder itemBuilder ： 构建子控件
            * typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index); 构建子控件的数目

            构造函数
            复制代码

              PageView.builder({
                Key key,
                this.scrollDirection = Axis.horizontal,
                this.reverse = false,
                PageController controller,
                this.physics,
                this.pageSnapping = true,
                this.onPageChanged,
                @required IndexedWidgetBuilder itemBuilder,
                int itemCount,
                this.dragStartBehavior = DragStartBehavior.start,
              }) : controller = controller ?? _defaultPageController,
                   childrenDelegate = SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
                   super(key: key);

            复制代码
        PageView.custom
            使用场景:创建一个可滚动的列表，自定义子项 构造函

            重要参数：

            * final SliverChildDelegate childrenDelegate;使用代理的方式构建子类列表

            构造函数
            复制代码

            PageView.custom({    Key key,
                this.scrollDirection = Axis.horizontal,
                this.reverse = false,
                PageController controller,
                this.physics,
                this.pageSnapping = true,
                this.onPageChanged,
                @required this.childrenDelegate,
                this.dragStartBehavior = DragStartBehavior.start,
              }) : assert(childrenDelegate != null),
                   controller = controller ?? _defaultPageController,
                   super(key: key);

            复制代码

三，参数解析

    final Axis scrollDirection: 视图滚动的方向。Defaults to [Axis.horizontal]
    final bool reverse：是否反转方向。  Defaults to false
        ScrollDirection 为 [Axis.horizontal]时，
           Reverse为false时，从左到右开始；
           Reverse为true时， 从右到左开始；
        ScrollDirection 为 [Axis.vertical]时，
           Reverse为false时，从上到下开始；
           Reverse为true时， 从下到上开始；
    final PageController controller：控制台。用于监听视图的滚动情况。页面视图应该如何响应用户输入。例如，确定用户停止拖动页视图后，页视图如何继续动画。
    final ValueChanged<int> onPageChanged：索引改变时触发。
    final bool pageSnapping：设置为 false 以禁用页面捕捉，对自定义滚动行为很有用。
    final ScrollPhysics physics：页面视图如何响应用户输入，即滚动的动画表现。
    final DragStartBehavior dragStartBehavior：确定处理拖动开始行为的方式

四，示例demo

    demo

复制代码

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyPageHome(title: 'pageViewDemo',),
    );
  }
}

class MyPageHome extends StatefulWidget {

  //属性
  String title;
  //构造函数
  MyPageHome({Key key,this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyPageHomeState();
  }
}

class MyPageHomeState extends State<MyPageHome> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new  Text(widget.title)
      ),

      body: new Center(
        child: new Container(
          width: 200,
          height: 200,
          child: new PageView(
            children: <Widget>[
              Image.network('https://ws1.sinaimg.cn/large/0065oQSqgy1fwgzx8n1syj30sg15h7ew.jpg'),
              Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
              Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg'),
              Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

复制代码
*
 */
/// PageView
class PageViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PageView'),
        leading: BackButton(),
      ),
      body: PageView.builder(itemBuilder: null),
    );
  }
}
