import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

/*
 * 在Flutter中发起HTTP网络请求
 * https://flutterchina.club/networking/
 */
class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    // 1.创建一个HTTP client. 该 client 支持常用的HTTP操作, such as GET, POST, PUT, DELETE.
    var httpClient = new HttpClient();
    // 2.构造 Uri.
    var url = 'https://httpbin.org/ip';
    // 处理异步
    //注意，HTTP API 在返回值中使用了Dart Futures。 我们建议使用async/await语法来调用API。
    String result;
    try {
      // 3.发起请求, 等待请求，同时您也可以配置请求headers、 body。
      var request = await httpClient.getUrl(Uri.parse(url));
      // 4.关闭请求, 等待响应.
      var response = await request.close();
      // 5.解码响应的内容.
      if (response.statusCode == HttpStatus.OK) {
        // JSON 用 JsonDecoder 或者加入 dart:convert 依赖 ， UTF8 用 Utf8Decoder
//        var responseBody = await response.transform(utf8.decoder).join();
        var responseBody = await response.transform(utf8.decoder).join();
        print('获取的responseBody = ' + responseBody);
        // I/flutter: 获取的responseBody = {"origin": "218.17.122.138, 218.17.122.138"}
        var data = jsonDecode(responseBody);
        result = data['origin'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    // 设置数据
    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      appBar: AppBar(
        title: Text('HttpTest'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              color: Colors.lightBlueAccent,
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
