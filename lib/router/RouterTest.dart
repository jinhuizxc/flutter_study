import 'package:flutter/material.dart';

/*
 * 路由跳转测试
 */
class RouterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '路由跳转测试',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 定义路由 结构: Map<String, WidgetBuilder>
      routes: {
        "/splash": (context) => new SplashPage1(),
        "/login": (context) => new LoginPage(),
        "/home": (context) => new HomePage(),
        "/detail": (context) => new DetailPage(),
      },
      //没有路由可以进行匹配的时候
      onGenerateRoute: (RouteSettings setting) {
        String name = setting.name;
        print("onUnknownRoute:$name");
        return new MaterialPageRoute(builder: (context) {
          return new NotFoundPage();
        });
      },
      home: new SplashPage1(),
    );
  }
}

// 路由跳转失败的页面
class NotFoundPage extends StatefulWidget {
  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('路由跳转失败的页面'),
      ),
    );
  }
}

// 详情页
class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('详情页'),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
              child: new Text('点击退出登录'),
            )
          ],
        ),
      )),
    );
  }
}

// 主页，显示一个列表
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                title: new Text('第$index项'),
                onTap: () {
//                  Navigator.of(context).pushNamed('/detail');
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new DetailPage();
                  }));
                },
              );
            }),
      ),
    );
  }
}

// login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text('这是登录界面'),
          new RaisedButton(
              child: Text('点击登录页面，跳转到主页'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              }),
          new RaisedButton(
              child: Text('点击跳转到NotFoundPage'),
              onPressed: () {
                Navigator.of(context).pushNamed('/111');
              }),
          new RaisedButton(
            child: Text('点击登录页面, 自定义动画，跳转到主页'),
            onPressed: () {
              // 自定义跳转动画
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      opaque: true,
                      pageBuilder: (context, _, __) {
                        return new HomePage();
                      },
//                      transitionDuration: Duration(seconds: 2),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: RotationTransition(
                            turns: Tween<double>(begin: 0.5, end: 1.0)
                                .animate(animation),
                            child: child,
                          ),
                        );
                      }));
            },
          )
        ],
      ),
    );
  }
}

// splash
class SplashPage1 extends StatefulWidget {
  @override
  _SplashPage1State createState() => _SplashPage1State();
}

class _SplashPage1State extends State<SplashPage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 2s后跳转登录页面;
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text("启动页面"),
      ),
    );
  }
}
