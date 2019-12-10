//import 'dart:io';
//
//import 'package:fluro/fluro.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_study/CounterDisplay.dart';
//import 'package:flutter_study/home/splash_page.dart';
//import 'package:flutter_study/main/WidgetStudy.dart';
//import 'package:flutter_study/routers/application.dart';
//import 'package:flutter_study/routers/routers.dart';
//import 'package:flutter_study/shop/Shop.dart';
//import 'package:flutter_study/wanandroid/common/common.dart';
//import 'package:flutter_study/wanandroid/utils/sp_util.dart';
//import 'package:flutter_study/wanandroid/utils/theme_util.dart';
//import 'package:oktoast/oktoast.dart';
//
//import 'RandomWords.dart';
//
//void main() async {
////      runApp(new MyApp1());
////    runApp(new ShopApp());  // 购物应用程序
////    runApp(new BaseWidget());  // 购物应用程序
////    runApp(new ListViewWidget1());  // 滚动组件ListView
////    runApp(new NestedScrollViewWidget());  // NestedScrollView
////    runApp(new GridViewWidget());
////    runApp(new MySingleChildScrollView());
////    runApp(new CustomScrollViewWidget());
////    runApp(new LoginPage1()); // 登录界面
////    runApp(new MaterialApp(home: new NewLoginPage())); // TODO 登录界面
////      runApp(OfficialApp());   // sample
////      runApp(new MaterialApp(home: new SharePreference()));   // 数据持久化
////       runApp(new WebSocketPage());   // websocket sample
////  runApp(new HttpPage()); // http sample
////  runApp(new TextFieldWidget());
////      runApp(new DioTest());   // dio框架测试;
////      runApp(new DioNewTest());
////      runApp(new BaseApp());    // TODO 程序效果入口;
////    runApp(new RouterTest());   // 路由跳转测试;
////     runApp(new RouterTests()); // 路由跳转测试1;
////    runApp(new MapTest());   // TODO 高德地图插件测试;
//  /* // TODO 指纹认证模块;
//    setupLocator();
//    runApp(new FingerTest());*/
//
////  runApp(MyDeer());
////  // 透明状态栏
////  if (Platform.isAndroid) {
////    SystemUiOverlayStyle systemUiOverlayStyle =
////        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
////    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
////  }
//
////  runApp(new MaterialApp(home: new SharePrefence()));
//
//  // HelloWorld
////      runApp(HelloWorld());
//  // 对齐方式align
////    runApp(new AlignWidgetTest());
////    runApp(new AlignLayout());
//  // FontWidget
////      runApp(FontWidget());
//  // Column垂直布局组件
////      runApp(ColumnWidget());
//  // Container组件
////      runApp(ContainerWidget());
////      runApp(ContainerLayout());
//  // Row水平布局组件
////      runApp(RowWidget());
//  // 组件学习
//
//  // TODO 因为添加了wanandroid项目的部分，所以这里的内容仅仅是供wanandroid app 调用, 后面根据学习调整
//  /// 修改问题: Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized
//  /// https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
//  WidgetsFlutterBinding.ensureInitialized();
//
//  await SPUtil.getInstance();
//
//  await getTheme();
//
//  runApp(WidgetStudy());
//
//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
//    // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
//
//
//
//}
//
///// 获取主题
//Future<Null> getTheme() async {
//  // 是否是夜间模式
//  bool dark = SPUtil.getBool(Constants.DARK_KEY, defValue: false);
//  ThemeUtils.dark = dark;
//}
//
//// MyDeer-App
////class MyDeer extends StatelessWidget {
////  MyDeer() {
////    final router = Router();
////    RoutesConstant.configureRoutes(router);
////    Application.router = router;
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return OKToast(
////        child: MaterialApp(
////          title: 'Flutter Deer',
////          //debugShowCheckedModeBanner: false,
////          theme: ThemeData(
////            primaryColor: Colours.app_main,
////            scaffoldBackgroundColor: Colors.white,
////          ),
////          home: SplashPage(),
////          onGenerateRoute: Application.router.generator,
////        ),
////        backgroundColor: Colors.black54,
////        textPadding:
////            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
////        radius: 20.0,
////        position: ToastPosition.bottom,
////        dismissOtherOnShow: true);
////  }
////}
//
///*class MyStudyApp extends StatelessWidget {
//
//  // 初始化路由
//  MyStudyApp()  {
//    final router = Router();
////    Routes.configureRoutes(router);
//    Application.router = router;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//}*/
//
//class ShopApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: 'Shopping App',
//      home: new ShoppingList(
//        products: <Product>[
//          new Product(name: 'Eggs'),
//          new Product(name: 'Flour'),
//          new Product(name: 'Chocolate chips'),
//        ],
//      ),
//    );
//  }
//}
//
//class MyApp1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new MaterialApp(
//      title: 'My app', // used by the OS task switcher
////      home: new MyScaffold(),
////      home: new TutorialHome(),
////      home: new MyButton(),
////      home: new Counter(),
//      home: new Counter(),
//    );
//  }
//}
//
//class MyApp extends StatelessWidget {
////  final wordPair = new WordPair.random();  // 放在这里只会执行一次;
//
//  // 热重载每次都会执行build()方法
//  @override
//  Widget build(BuildContext context) {
////    final wordPair = new WordPair.random();
//
//    return new MaterialApp(
//      /*title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter',
//              style: TextStyle(backgroundColor: Colors.red)),
//        ),
//        body: new Center(
////          child: new Text('Hello World'),
////          child: new Text(wordPair.asPascalCase),
////          child: new RandomWords(),
//        ),
//      ),*/
//      title: 'Startup Name Generator',
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
//      home: new RandomWords(),
//    );
//  }
//}
