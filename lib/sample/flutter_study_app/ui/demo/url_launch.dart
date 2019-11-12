import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*
 *
 */
class UrlLauncherDemo extends StatefulWidget {
  @override
  _UrlLauncherDemoState createState() => _UrlLauncherDemoState();
}

class _UrlLauncherDemoState extends State<UrlLauncherDemo> {
  String _rel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("url_launcher"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'tel:110';
                    _launchURL(url);
                  },
                  child: Text("拨打电话给我吧！没事别骚扰我"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'sms:13166688899';
                    _launchURL(url);
                  },
                  child: Text("发送短信"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    // mailto:superluo666@gmail.com?subject=Test&body=测试跳转发送邮件
                    const url =
                        'mailto:1004260403@qq.com?subject=Test&body=测试跳转发送邮件';
                    _launchURL(url);
                  },
                  child: Text("发送邮件"),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'https://github.com/ChessLuo/flutter_study_app';
                  _launchURL(url);
                },
                child: Text("默认浏览器中打开URL"),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'weixin://';
                    _launchURL(url);
                  },
                  child: Text("打开微信， 搜索程序猿在广东"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url =
                        'mqqwpa://im/chat?chat_type=wpa&uin=1004260403'; //uin是发送过去的qq号码
                    _launchURL(url);
                  },
                  child: Text("打开QQ"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url =
                        'taobao://item.taobao.com/item.html?id=443534567';
                    _launchURL(url);
                  },
                  child: Text("打开淘宝"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    // 调用该接口可调起Android百度地图，且在指定坐标点上显示点的名称和内容信息。
                    //URL接口：baidumap://map/marker
                    const url = 'baidumap://map/marker';
                    _launchURL(url);
                  },
                  child: Text("打开百度地图"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'androidamap://viewMap';
                    _launchURL(url);
                  },
                  child: Text("打开高德地图"),
                )),
            Text(_rel),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      setState(() {
        _rel = 'Could not launch $url';
      });
    }
  }
}
