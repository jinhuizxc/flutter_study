import 'package:dio/dio.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api.dart';
import 'package:flutter_study/wanandroid/data/model/article_model.dart';
import 'package:flutter_study/wanandroid/data/model/banner_model.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/net/dio_manager.dart';

/// ApiService
ApiService _apiService = new ApiService();

ApiService get apiService => _apiService;

class ApiService {
  Options _getOption() {
    Map<String, String> map = new Map();
    map["Cookie"] = User().cookie.toString();
    return Options(headers: map);
  }

  ///  获取首页轮播数据
  void getBannerList(Function callback) async {
    dio.get(Api.HOME_BANNER).then((response) {
      callback(BannerModel.fromJson(response.data));
    });
  }

  /// 获取首页置顶文章数据
  void getTopArticleList(Function callback, Function errorCallback) async {
    dio.get(Api.HOME_TOP_ARTICLE_LIST).then((response) {
      callback(TopArticleModel.fromJson(response.data));
    });
  }

  /// 获取首页文章列表数据
  void getArticleList(Function callback, Function errorCallback, int _page) async {
    dio.get(Api.HOME_ARTICLE_LIST + "/$_page/json").then((response){
      callback(ArticleModel.fromJson(response.data));
    }).catchError((e){
      errorCallback(e);
    });
  }

  /// 新增收藏(收藏站内文章)
  void addCollection(Function callback, Function errorCallback, int _id) async {
    dio.post(Api.ADD_COLLECTION + "/$_id/json").then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 取消收藏
  void cancelCollection(Function callback, Function errorCallback, int _id) async {
    dio.post(Api.CANCEL_COLLECTION + "/$_id/json").then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

}
