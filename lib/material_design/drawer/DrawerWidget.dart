import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * 抽屉组件
 */
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      body: new Center(
        child: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息 头像、用户名、Email等
            UserAccountsDrawerHeader(
              accountName: Text('jinhuizxc'),
              accountEmail: Text('1004260403@qq.com'),
              //设置当前用户头像
              currentAccountPicture: CircleAvatar(
                // AssetImage->AssetBundleImageProvider->ImageProvider
                backgroundImage: new AssetImage('assets/images/flutter.png'),
              ),
              onDetailsPressed: () {
                Fluttertoast.showToast(msg: 'onDetailsPressed');
              },
              //属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('assets/images/weixin.jpg'),
                )
              ],
              arrowColor: Colors.blueAccent,
            ),
            
            ListTile(
              onTap: (){
                Fluttertoast.showToast(msg: '个性装扮');
              },
              leading: new CircleAvatar(
                child: Icon(Icons.color_lens),   // 导航栏菜单
              ),
              title: Text('个性装扮'),
              subtitle: Text('subtitle1'),
            ),
            ListTile(
              onTap: (){
                Fluttertoast.showToast(msg: '我的相册');
              },
              leading: new CircleAvatar(
                child: Icon(Icons.photo),
              ),
              title: Text('我的相册'),
              subtitle: Text('subtitle2'),
            ),
            ListTile(
              onTap: (){
                Fluttertoast.showToast(msg: '免流量特权');
              },
              leading: new CircleAvatar(
                child: Icon(Icons.wifi),
              ),
              title: Text('免流量特权'),
              subtitle: Text('subtitle3'),
            ),
          ],
        ),
      ),
    );
  }
}
