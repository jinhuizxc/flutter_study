import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// HttpClient请求方式
class HttpClientStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发起HttpClient请求'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("发起HttpClient请求"),
          onPressed: getHttpClientData,
        ),
      ),
    );
  }

  //获取数据 此方法需要异步执行async/await
  void getHttpClientData() async{
    try{
      //实例化一个HttpClient对象
      HttpClient httpClient = HttpClient();
      //发起请求 (IP + PORT + 请求接口)
      var url = 'https://wanandroid.com/wxarticle/chapters/json';
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      //等待服务器返回数据
      HttpClientResponse response = await request.close();
      //使用utf8.decoder从response里解析数据
      var result = await response.transform(utf8.decoder).join();
      //输出响应头
      Fluttertoast.showToast(msg: result);
      //httpClient关闭
      httpClient.close();
    }catch(e){
      print("请求失败：$e");
      Fluttertoast.showToast(msg: e);
    }finally{

    }
  }
}
