import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/collection_model.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/custom_cached_image.dart';
import 'package:flutter_study/wanandroid/widgets/like_button_widget.dart';

/// 收藏item
class ItemCollectList extends StatefulWidget {
  CollectionBean item;

  /// 收藏的回调函数
  Function onCollectCallBack;

  ItemCollectList({this.item, this.onCollectCallBack});

  @override
  _ItemCollectListState createState() => _ItemCollectListState();
}

class _ItemCollectListState extends State<ItemCollectList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, item.link);
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Offstage(
                offstage: item.envelopePic == '',
                child: Container(
                  width: 100,
                  height: 80,
                  padding: EdgeInsets.fromLTRB(16, 10, 8, 10),
                  child: CustomCachedImage(
                    imageUrl: item.envelopePic,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.author,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                            child: Text(
                          item.niceDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.right,
                        ))
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
                            style: TextStyle(fontSize: 16),
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
                            item.chapterName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        LikeButtonWidget(
                          isLike: true,
                          onClick: () {
                            cancelCollect(item);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
          Divider(height: 1),
        ],
      ),
    );
  }

  /// 取消收藏
  void cancelCollect(item) async {
    List<String> coolies = User.singleton.cookie;
    if (coolies == null || coolies.length == 0) {
      ToastUtil.show(msg: '请先登录');
    } else {
      apiService.cancelCollection(
          (BaseModel model) {
            if (model.errorCode == Constants.STATUS_SUCCESS) {
              ToastUtil.show(msg: '已取消收藏');
              widget.onCollectCallBack(true);
            }else{
              ToastUtil.show(msg: '取消收藏失败');
              widget.onCollectCallBack(false);
            }
          }, (DioError error) {
            print(error.message);
      }, item.originId);
    }
  }
}
