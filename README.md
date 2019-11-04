# flutter_study
# 环境搭建
https://www.jianshu.com/p/35326ec8090f
# 开发文档
https://flutter.cn/docs
# Flutter->JSON解析
https://segmentfault.com/a/1190000020134951
# Flutter页面布局 Stack层叠组件 Stack与Align Stack与Positioned实现定位布局
https://www.cnblogs.com/yiweiyihang/p/11451966.html
# Flutter Codelabs
https://codelabs.flutter-io.cn/#codelabs
# Flutter 常用工具类库common_utils
http://www.imooc.com/article/details/id/253896


---
## Align 对齐方式
```
class AlignWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Align对齐方式',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Align控件'),
        ),
        body: new AlignWidget(),
      ),
    );
  }
}

class AlignWidget extends StatefulWidget {
  @override
  _AlignWidgetState createState() => _AlignWidgetState();
}

/*
 * 测试思路
 * 最外层: Container
 * 内层: Align
 * align内部一个Container容器组件，包含一个child文本
 *
 * 未指定外层容器的高度，可以通过指定Align的宽高(内部是Container的倍数)
 *  widthFactor: 2.0,
 *  heightFactor: 2.0,
 *
 */
class _AlignWidgetState extends State<AlignWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      // 指定外层容器的高度
      width: 400,
      height: 400,
      child: Align(
        // Alignment.bottomCenter/bottomRight/topLeft
//        alignment: Alignment.topLeft,
      // 位置区间（-1, -1）左上角,(0.0, 0.0)为中心位置，(1, 1)为右下角
      alignment: Alignment(-1, -1),
        // 指定Align的宽高是Container的2倍
//        widthFactor: 3.0,
//        heightFactor: 3.0,
        child: Container(
            color: Colors.green,
            width: 100,
            height: 50,
            child: Text(
              '我是content',
              // 指定文本的位置
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
```

## Flutter：问题收录
- https://blog.csdn.net/u013066292/article/details/80527066
