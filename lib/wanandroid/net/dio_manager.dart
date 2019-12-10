import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study/wanandroid/data/api.dart';
import 'package:path_provider/path_provider.dart';

import 'interceptors/cookie_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'package:cookie_jar/cookie_jar.dart';

/// 使用默认配置
Dio _dio = new Dio();

// get方法
Dio get dio => _dio;

/// dio 配置
class DioManager {
  static Future init() async {
    dio.options.baseUrl = Api.BASE_HOST;
    dio.options.connectTimeout = 30 * 1000;
    dio.options.sendTimeout = 30 * 1000;
    dio.options.receiveTimeout = 30 * 1000;
//    dio.options.contentType
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    // TODO 网络环境监听
    dio.interceptors.add(LogInterceptors());
    dio.interceptors.add(ErrorInterceptor());
    // dio.interceptors.add(CookieInterceptor2());
    // TODO 引用 import 'package:path_provider/path_provider.dart';
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path + '/dioCookie';
    print('DioUtil : http cookie path = $tempPath');
    CookieJar cj = PersistCookieJar(dir: tempPath, ignoreExpires: true);
    dio.interceptors.add(CookieInterceptor(cj));
  }

  /// 处理错误方法, 定义一个命名参数的方法
  static String handleError(error, {String defaultErrorStr = '未知错误~'}) {
    String errorStr;
    if (error is DioError) {
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorStr = '连接超时~';
      } else if (error.type == DioErrorType.SEND_TIMEOUT) {
        errorStr = '请求超时~';
      } else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorStr = '响应超时~';
      } else if (error.type == DioErrorType.CANCEL) {
        errorStr = '请求取消~';
      } else if (error.type == DioErrorType.RESPONSE) {
        int statusCode = error.response.statusCode;
        String msg = error.response.statusMessage;

        /// TODO 异常状态码的处理
        switch (statusCode) {
          case 500:
            errorStr = '服务器异常';
            break;
          case 404:
            errorStr = '未找到资源~';
            break;
          default:
            errorStr = '$msg[$statusCode]';
            break;
        }
      } else if (error.type == DioErrorType.DEFAULT) {
        errorStr = '${error.message}';
        if (error.error is SocketException) {
          errorStr = '网络连接超时~';
        }
      } else {
        errorStr = '未知错误';
      }
    }
    return errorStr ?? defaultErrorStr;
//    return errorStr == null ? "" : defaultErrorStr;
  }
}
