import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/data/model/collection_model.dart';

class ItemCollect extends StatefulWidget {

  CollectionBean item;

  /// 收藏的回调函数
  Function onCollectCallBack;


  ItemCollect({this.item, this.onCollectCallBack});

  @override
  _ItemCollectState createState() => _ItemCollectState();
}

class _ItemCollectState extends State<ItemCollect> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
