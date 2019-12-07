import 'package:amap_location/amap_location.dart';
import 'package:amap_location/amap_location_option.dart';
import 'package:flutter/material.dart';


/*
 * 高德地图flutter定位组件
 * https://github.com/best-flutter/flutter_amap_location
 */
class MapTest extends StatefulWidget {
  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  @override
  void initState() {
    super.initState();

    /*============*/
    //设置ios的key
    /*=============*/
    AMapLocationClient.setApiKey("你的key");
    /*============*/
    //设置ios的key
    /*=============*/
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Home(),
      // 初始化路配置
      routes: {
        '/location/get': (BuildContext context) => new LocationGet(),
        '/location/listen': (BuildContext context) => new LocationListen()
      },
    );
  }
}

// 主页
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //启动客户端,这里设置ios端的精度小一点
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    super.initState();
  }

  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }

  // List<Map<String, String>> list
  List<Widget> render(BuildContext context, List list) {
    return ListTile.divideTiles(
        context: context,
        tiles: list.map((dynamic item) {
          return buildListTile(
              context, item['title'], item['subtitle'], item['url']);
        })).toList();
  }

  Widget buildListTile(
      BuildContext context, String title, String subtitle, String url) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(url);
      },
      title: Text(title),
      isThreeLine: true,
      dense: true,
      leading: null,
      subtitle: Text(subtitle),
      // 右侧图标
      trailing: new Icon(
        Icons.arrow_right,
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('高德地图定位'),
      ),
      body: new Scrollbar(
          child: ListView(
        children: render(context, [
          {
            "title": "直接获取定位",
            "subtitle": "不需要先启用监听就可以直接获取定位",
            "url": "/location/get"
          },
          {"title": "监听定位", "subtitle": "启动定位改变监听", "url": "/location/listen"},
        ]),
      )),
    );
  }
}

class LocationGet extends StatefulWidget {
  @override
  _LocationGetState createState() => _LocationGetState();
}

class _LocationGetState extends State<LocationGet> {
  AMapLocation _location;

  @override
  void initState() {
    _checkPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('直接获取定位'),
      ),
      body: new Center(),
    );
  }

  @override
  void dispose() {
    //这里可以停止定位
    AMapLocationClient.stopLocation();
    super.dispose();
  }

  // 检查权限
  void _checkPermission() async{
//    await Simple
  }

}

class LocationListen extends StatefulWidget {
  @override
  _LocationListenState createState() => _LocationListenState();
}

class _LocationListenState extends State<LocationListen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
