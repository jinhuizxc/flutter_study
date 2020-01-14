import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/wx_article_model.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/like_button_widget.dart';

class ItemWeChatList extends StatefulWidget {
  WXArticleBean item;

  ItemWeChatList({this.item});

  @override
  State<StatefulWidget> createState() {
    return new ItemWeChatListState();
  }
}

class ItemWeChatListState extends State<ItemWeChatList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, item.link);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  item.author.isNotEmpty ? item.author : item.shareUser,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Text(
                    item.niceDate,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.superChapterName + " / " + item.chapterName,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.left,
                  ),
                ),
                LikeButtonWidget(
                  isLike: item.collect,
                  onClick: () {
                    addOrCancelCollect(item);
                  },
                )
              ],
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }

  /// 添加收藏或者取消收藏
  void addOrCancelCollect(item) {
    List<String> cookies = User.singleton.cookie;
    if (cookies == null || cookies.length == 0) {
      ToastUtil.show(msg: '请先登录~');
    } else {
      if (item.collect) {
        apiService.cancelCollection((BaseModel model) {
          if (model.errorCode == Constants.STATUS_SUCCESS) {
            ToastUtil.show(msg: '已取消收藏~');
            setState(() {
              item.collect = false;
            });
          } else {
            ToastUtil.show(msg: '取消收藏失败~');
          }
        }, (DioError error) {
          print(error.response);
        }, item.id);
      } else {
        apiService.addCollection((BaseModel model) {
          if (model.errorCode == Constants.STATUS_SUCCESS) {
            ToastUtil.show(msg: '收藏成功~');
            setState(() {
              item.collect = true;
            });
          } else {
            ToastUtil.show(msg: '收藏失败~');
          }
        }, (DioError error) {
          print(error.response);
        }, item.id);
      }
    }
  }
}