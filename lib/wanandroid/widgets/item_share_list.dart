import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/share_model.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/custom_cached_image.dart';
import 'package:flutter_study/wanandroid/widgets/like_button_widget.dart';

/// 分享的item
class ItemShareList extends StatefulWidget {
  ShareBean item;

  /// 滑动删除Controller
  SlidableController slidableController;

  Function deleteItemCallback;

  ItemShareList({this.item, this.slidableController, this.deleteItemCallback});

  @override
  _ItemShareListState createState() => _ItemShareListState();
}

class _ItemShareListState extends State<ItemShareList> {
  @override
  Widget build(BuildContext context) {
    SlidableController slidableController = widget.slidableController;
    var item = widget.item;
    return Slidable(
      controller: slidableController,
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          RouteUtil.toWebView(context, item.title, item.link);
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: <Widget>[
                  Offstage(
                    offstage: item.top == 0,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Color(0xFFF44336), width: 0.5),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(2, 2),
                            bottom: Radius.elliptical(2, 2)),
                      ),
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        "置顶",
                        style: TextStyle(
                            fontSize: 10, color: const Color(0xFFF44336)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: !item.fresh,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Color(0xFFF44336), width: 0.5),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(2, 2),
                            bottom: Radius.elliptical(2, 2)),
                      ),
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        "新",
                        style: TextStyle(
                            fontSize: 10, color: const Color(0xFFF44336)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: item.tags.length == 0,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.cyan, width: 0.5),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(2, 2),
                            bottom: Radius.elliptical(2, 2)),
                      ),
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        item.tags.length > 0 ? item.tags[0].name : "",
                        style: TextStyle(fontSize: 10, color: Colors.cyan),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: item.audit != 0,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.cyan, width: 0.5),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(2, 2),
                            bottom: Radius.elliptical(2, 2)),
                      ),
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        "待审核",
                        style: TextStyle(fontSize: 10, color: Colors.cyan),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
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
              child: Row(
                children: <Widget>[
                  Offstage(
                    offstage: item.envelopePic == "",
                    child: Container(
                        width: 100,
                        height: 80,
                        padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                        child: CustomCachedImage(imageUrl: item.envelopePic)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Text(
                            item.title,
                            maxLines: 2,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  item.superChapterName +
                                      " / " +
                                      item.chapterName,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[600]),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1)
          ],
        ),
      ),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            showDialog(context: context, builder: (context) =>
            new AlertDialog(
              content: new Text('确定删除吗？'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('取消', style: TextStyle(color: Colors.cyan)),
                ),
              ],
            ));
          },
        )
      ],
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
