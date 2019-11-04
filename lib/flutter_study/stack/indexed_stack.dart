import 'package:flutter/material.dart';

/*
 * Flutter入门学习--(20)层布局控件IndexedStack
 * https://blog.csdn.net/zx13525079024/article/details/86675226
 *
 * IndexedStack和Stack一样，都是层布局控件， 可以在一个控件上面放置另一个控件，
 * 但唯一不同的是IndexedStack在同一时刻只能显示子控件中的一个控件，
 * 通过Index属性来设置显示的控件，下面的例子中，在IndexedStack放置了2张图片，只显示第二张
 *
 */
class IndexedStackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack布局控件'),
      ),
      body: Container(
        child: new IndexedStack(
          index: 1,
          children: <Widget>[
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572864215387&di=2be79da59866b92088dc5dc9f8013b4b&imgtype=0&src=http%3A%2F%2Fimg02.tooopen.com%2Fimages%2F20150714%2Ftooopen_sy_133978098392.jpg",
              fit: BoxFit.fill,
            ),
            Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572864215387&di=425cbcb308264bf0a40360d35b3484a2&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1212%2F10%2Fc1%2F16491245_1355126013759.jpg",
                fit: BoxFit.fill)
          ],
        ),
      ),
    );
  }
}
