import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// http请求示例
/*
 * http请求示例 ->正文: {"data":[
 * {"children":[],"courseId":13,"id":408,"name":"鸿洋",
 * "order":190000,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":409,"name":"郭霖","order":190001,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":410,"name":"玉刚说","order":190002,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":411,"name":"承香墨影","order":190003,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":413,"name":"Android群英传","order":190004,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":414,"name":"code小生","order":190005,"parentChapterId":407,"userControlSetTop":false,"visible":1},
 * {"children":[],"courseId":13,"id":415,"name":"谷歌开发者","order":190006,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":416,"name":
 */
// Http请求方式
class HttpStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http请求示例'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //请求后台url路径(IP + PORT + 请求接口)
            var url = 'https://wanandroid.com/wxarticle/chapters/json';
            // 获取公众号列表
            // https://wanandroid.com/wxarticle/chapters/json
            //方法： GET
            //向后台发起get请求 response为返回对象
            http.get(url).then((response) {
              print('http请求示例 ->状态: ${response.statusCode}'); // I/flutter: http请求示例 ->状态: 200
              print("http请求示例 ->正文: ${response.body}");
              Fluttertoast.showToast(msg: response.body);
            });
          },
          child: Text('发起http请求'),
        ),
      ),
    );
  }
}
