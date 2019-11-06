# Flutter组件学习

## 环境搭建
https://www.jianshu.com/p/35326ec8090f
## 开发文档
https://flutter.cn/docs

## Flutter Codelabs
https://codelabs.flutter-io.cn/#codelabs

### Flutter学习
- [Flutter中的Key，LocalKey，GlobalKey...](https://segmentfault.com/a/1190000011276853)
- [Flutter页面布局 Stack层叠组件 Stack与Align Stack与Positioned实现定位布局](https://www.cnblogs.com/yiweiyihang/p/11451966.html)
- [Flutter->JSON解析](https://segmentfault.com/a/1190000020134951)
- [Flutter（五）TextField](https://www.jianshu.com/p/f7b37f7fa2a0)
- [Flutter（二十八）NotificationListener](https://www.jianshu.com/p/6dc3cca1d99a)
- [SingleChildScrollView的使用](https://blog.csdn.net/weixin_43266090/article/details/94165846)
- [flutter自定义View(CustomPainter) 之 canvas的方法总结](https://blog.csdn.net/u011272795/article/details/83828732)
- [Flutter mainAxisAlignment和crossAxisAlignment](https://www.jianshu.com/p/731e55f76c7b)
- [Flutter widget动画效果之CurvedAnimation](https://www.jianshu.com/p/ef7690e1a385)
- [Flutter之BoxDecoration用法详解(很详细，值得看)](https://www.jianshu.com/p/9012bc9e2feb)
- [Flutter中的AutomaticKeepAliveClientMixin](https://blog.csdn.net/xcf111/article/details/95318987)
- [Flutter - Drawer 抽屉视图与自定义header](https://www.jianshu.com/p/956bb41bb524)
---
### 参考项目/资料:
- [Flutter之撸一个漂亮的登录界面的总结](https://www.jianshu.com/p/0c2ba709b95e)
- [flutter-learing](https://github.com/LXD312569496/flutter-learing)
- [Login page](https://github.com/huextrat/TheGorgeousLogin)
- [Flutter常用工具类库common_utils](http://www.imooc.com/article/details/id/253896)
- [Flutter pageview切换指示器](https://www.jianshu.com/p/c0fc4ab3e9c6)
- [flutter开发----图标库的使用](https://blog.csdn.net/qq_35905501/article/details/90270010)
- [flutter_study_app](https://github.com/ChessLuo/flutter_study_app)
- [使用Fluro实现Flutter界面跳转](https://blog.csdn.net/baidu_32377671/article/details/83788125)
- [fluro](https://github.com/theyakka/fluro)
- [Flutter ——状态管理 | StreamBuild](https://www.jianshu.com/p/846abf65cd9b)
- [flutter学习demo，使用到了一些常用基本组件，WebView，Shared Preferences，EventBus，Dio网络请求，flukit UI组件库，Toast，permission_handler权限申请，cached_network_image网络图片缓存，image_gallery_saver图片存储等，
使用FlutterJsonBeanFactory插件完成JsonBean的转化 ](https://github.com/joudev/flutter-all-blue)
---
### 打包
- [安卓客户端打包](https://www.jianshu.com/p/f91b4e84cec8)



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
