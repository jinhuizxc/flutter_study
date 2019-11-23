import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Dio请求方法封装
Future request(url, {formData}) async {
  try {
    // 初始化dio
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');

    Response response;
    //发起POST请求 传入url及表单参数
    response = await dio.post(url, data: formData);
    //成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常,请检查测试代码和服务器运行情况...');
    }
  } catch (e) {
    return print('error:${e}');
  }
}

Future requestList(url) async{
  try {
    Dio dio = new Dio();
    Response response;
    //发起POST请求 传入url及表单参数
    response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      Fluttertoast.showToast(msg: '服务器异常...');
    }
  } catch (e) {
  return print('error:${e}');
  }

}
