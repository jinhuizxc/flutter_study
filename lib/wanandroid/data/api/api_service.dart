import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api.dart';
import 'package:flutter_study/wanandroid/data/model/article_model.dart';
import 'package:flutter_study/wanandroid/data/model/banner_model.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/collection_model.dart';
import 'package:flutter_study/wanandroid/data/model/knowledge_detail_model.dart';
import 'package:flutter_study/wanandroid/data/model/knowledge_tree_model.dart';
import 'package:flutter_study/wanandroid/data/model/navigation_model.dart';
import 'package:flutter_study/wanandroid/data/model/project_article_model.dart';
import 'package:flutter_study/wanandroid/data/model/project_tree_model.dart';
import 'package:flutter_study/wanandroid/data/model/rank_model.dart';
import 'package:flutter_study/wanandroid/data/model/share_model.dart';
import 'package:flutter_study/wanandroid/data/model/todo_list_model.dart';
import 'package:flutter_study/wanandroid/data/model/user_info_model.dart';
import 'package:flutter_study/wanandroid/data/model/user_model.dart';
import 'package:flutter_study/wanandroid/data/model/user_score_model.dart';
import 'package:flutter_study/wanandroid/data/model/wx_article_model.dart';
import 'package:flutter_study/wanandroid/data/model/wx_chapters_model.dart';
import 'package:flutter_study/wanandroid/net/dio_manager.dart';

/// ApiService
ApiService _apiService = new ApiService();

ApiService get apiService => _apiService;

class ApiService {
  /*Options _getOption() {
    Map<String, String> map = new Map();
    map["Cookie"] = User().cookie.toString();
    return Options(headers: map);
  }*/

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
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取首页文章列表数据
  void getArticleList(
      Function callback, Function errorCallback, int _page) async {
    dio.get(Api.HOME_ARTICLE_LIST + "/$_page/json").then((response) {
      callback(ArticleModel.fromJson(response.data));
    }).catchError((e) {
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
  void cancelCollection(
      Function callback, Function errorCallback, int _id) async {
    dio.post(Api.CANCEL_COLLECTION + "/$_id/json").then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取用户个人信息
  void getUserInfo(Function callback, Function errorCallback) async {
    dio.get(Api.USER_INFO).then((response) {
      callback(UserInfoModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取收藏列表
  void getCollectionList(
      Function callback, Function errorCallback, int _page) async {
    dio.get(Api.COLLECTION_LIST + '/$_page/json').then((response) {
      callback(CollectionModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 退出登录
  void logout(Function callback, Function errorCallback) async {
    dio.get(Api.USER_LOGOUT).then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((error) {
      errorCallback(e);
    });
  }

  /// 登录, FormData表单形式提交登录数据key-value数据形式
  void login(Function callback, Function errorCallback, String _username,
      String _password) async {
    FormData formData =
        new FormData.fromMap({'username': _username, 'password': _password});
    dio.post(Api.USER_LOGIN, data: formData).then((response) {
      callback(UserModel.fromJson(response.data), response);
    }).catchError((error) {
      errorCallback(error);
    });
  }

  /// 注册
  void register(Function callback, Function errorCallback, String _username,
      String _password) async {
    FormData formData = new FormData.fromMap({
      'username': _username,
      'password': _password,
      'repassword': _password
    });
    dio.post(Api.USER_REGISTER, data: formData).then((response){
      callback(UserModel.fromJson(response.data));
    }).catchError((e){
      errorCallback(e);
    });
  }

  /// 获取积分排行榜列表
  void getRankList(Function callback, Function errorCallback, int _page) async {
    dio.get(Api.RANK_LIST + "/$_page/json").then((response) {
      callback(RankModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取我的积分列表数据
  void getUserScoreList(Function callback, Function errorCallback, int _page) async {
    dio.get(Api.USER_SCORE_LIST + "/$_page/json").then((response) {
      callback(UserScoreModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取我的分享列表数据
  void getShareList(
      Function callback, Function errorCallback, int _page) async {
    dio.get(Api.SHARE_LIST + "/$_page/json").then((response) {
      callback(ShareModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 删除已分享的文章
  void deleteShareArticle(
      Function callback, Function errorCallback, int _id) async {
    dio.post(Api.DELETE_SHARE_ARTICLE + "/$_id/json").then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 分享文章
  void shareArticle(Function callback, Function errorCallback, params) async {
    dio.post(Api.SHARE_ARTICLE_ADD, queryParameters: params).then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取广场列表数据
  void getSquareList(
      Function callback, Function errorCallback, int _page) async {
    dio.get(Api.SQUARE_LIST + "/$_page/json").then((response) {
      callback(ArticleModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取公众号名称
  void getWXChaptersList(Function callback, Function errorCallback) async {
    dio.get(Api.WX_CHAPTERS_LIST).then((response) {
      callback(WXChaptersModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取公众号文章列表数据
  void getWXArticleList(
      Function callback, Function errorCallback, int _id, int _page) async {
    dio.get(Api.WX_ARTICLE_LIST + "/$_id/$_page/json").then((response) {
      callback(WXArticleModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取知识体系数据
  void getKnowledgeTreeList(Function callback, Function errorCallback) async {
    dio.get(Api.KNOWLEDGE_TREE_LIST).then((response) {
      callback(KnowledgeTreeModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取知识体系详情数据
  void getKnowledgeDetailList(
      Function callback, Function errorCallback, int _page, int _id) async {
    dio.get(Api.KNOWLEDGE_DETAIL_LIST + "/$_page/json?cid=$_id")
        .then((response) {
      callback(KnowledgeDetailModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取导航列表数据
  void getNavigationList(Function callback, Function errorCallback) async {
    dio.get(Api.NAVIGATION_LIST).then((response) {
      callback(NavigationModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取项目分类列表数据
  void getProjectTreeList(Function callback, Function errorCallback) async {
    dio.get(Api.PROJECT_TREE_LIST).then((response) {
      callback(ProjectTreeModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取项目文章列表数据
  void getProjectArticleList(
      Function callback, Function errorCallback, int _id, int _page) async {
    dio.get(Api.PROJECT_ARTICLE_LIST + "/$_page/json?cid=$_id")
        .then((response) {
      callback(ProjectArticleListModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取未完成TODO列表
  void getNoTodoList(
      Function callback, Function errorCallback, int _type, int _page) async {
    dio.post(Api.NO_TODO_LIST + "/$_type/json/$_page").then((response) {
      callback(TodoListModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 获取已完成TODO列表
  void getDoneTodoList(
      Function callback, Function errorCallback, int _type, int _page) async {
    dio.post(Api.DONE_TODO_LIST + "/$_type/json/$_page").then((response) {
      callback(TodoListModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 新增一个TODO
  void addTodo(Function callback, Function errorCallback, params) async {
    dio.post(Api.ADD_TODO, queryParameters: params).then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 根据ID更新TODO
  void updateTodo(
      Function callback, Function errorCallback, int _id, params) async {
    dio.post(Api.UPDATE_TODO + "/$_id/json", queryParameters: params)
        .then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 仅更新完成状态Todo
  void updateTodoState(
      Function callback, Function errorCallback, int _id, params) async {
    dio.post(Api.UPDATE_TODO_STATE + "/$_id/json", queryParameters: params)
        .then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }

  /// 根据ID删除TODO
  void deleteTodoById(
      Function callback, Function errorCallback, int _id) async {
    dio.post(Api.DELETE_TODO_BY_ID + "/$_id/json").then((response) {
      callback(BaseModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }









}
