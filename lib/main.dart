import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_study/CounterDisplay.dart';
import 'package:flutter_study/MyAppBar.dart';
import 'package:flutter_study/MyButton.dart';
import 'package:flutter_study/base/BaseWidget.dart';
import 'package:flutter_study/shop/Shop.dart';
import 'RandomWords.dart';
/*
 * 参考资源: 三天学会Flutter
 * https://github.com/luhenchang/flutter_study
 *
 *
 * Flutter项目: Flutter淘宝App，支持iOS、Android
 * https://github.com/GanZhiXiong/GZXTaoBaoAppFlutter
 *
 * 官网学习flutter;
 * https://flutterchina.club/
 *
 * 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
 * Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂。
 * widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己。
 * 本示例中的body的widget树中包含了一个Center widget, Center widget又包含一个 Text 子widget。 Center widget可以将其子widget树对其到屏幕中心。
 *
 * english_words: ^3.1.0: 包含数千个最常用的英文单词以及一些实用功能.
 *
 * 添加一个 有状态的部件（Stateful widget）
 * Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
 *
 * 创建一个无限滚动ListView
 * 添加交互
 * 导航到新页面
 * 使用主题更改UI
 *
 * Text：该 widget 可让创建一个带格式的文本。
 * Row、 Column： 这些具有弹性空间的布局类Widget可让您在水平（Row）和垂直（Column）方向上创建灵活的布局。其设计是基于web开发中的Flexbox布局模型。
 * Stack： 取代线性布局 (译者语：和Android中的LinearLayout相似)，Stack允许子 widget 堆叠， 你可以使用 Positioned 来定位他们相对于Stack的上下左右四条边的位置。Stacks是基于Web开发中的绝度定位（absolute positioning )布局模型设计的。
 * Container： Container 可让您创建矩形视觉元素。container 可以装饰为一个BoxDecoration, 如 background、一个边框、或者一个阴影。
 * Container 也可以具有边距（margins）、填充(padding)和应用于其大小的约束(constraints)。另外， Container可以使用矩阵在三维空间中对其进行变换。
 *
 * 基础组件的学习:
 * Container一个拥有绘制、定位、调整大小的 widget。

 */
import 'package:flutter/material.dart';

import 'TutorialHome.dart';

void main() =>
//    runApp(new MyApp1());
//    runApp(new ShopApp());  // 购物应用程序
    runApp(new BaseWidget());  // 购物应用程序

class ShopApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Shopping App',
      home: new ShoppingList(products: <Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Chocolate chips'),
      ],),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'My app', // used by the OS task switcher
//      home: new MyScaffold(),
//      home: new TutorialHome(),
//      home: new MyButton(),
//      home: new Counter(),
      home: new Counter(),
    );
  }
}

class MyApp extends StatelessWidget {
//  final wordPair = new WordPair.random();  // 放在这里只会执行一次;

  // 热重载每次都会执行build()方法
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return new MaterialApp(
      /*title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter',
              style: TextStyle(backgroundColor: Colors.red)),
        ),
        body: new Center(
//          child: new Text('Hello World'),
//          child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
        ),
      ),*/
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}
