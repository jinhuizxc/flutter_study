import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * PopupMenuButton弹出菜单组件
 * 
    const PopupMenuButton({
    Key key,
    @required this.itemBuilder,
    this.initialValue,//初始值，如果itemBuilder里该值，则会高亮显示
    this.onSelected,//选中弹出弹出选项的回调
    this.onCanceled,//点屏幕外取消回调,点击屏幕其他地方时调用
    this.tooltip,//
    this.elevation = 8.0,//
    this.padding = const EdgeInsets.all(8.0),
    this.child,//修改PopupMenuButton默认三个点的图标为设置的child，不能与icon同时使用
    this.icon,//修改PopupMenuButton默认三个点的图标为设置的icon，不能与child同时使用
    this.offset = Offset.zero,
    })
 */
class PopupMenuButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton组件示例'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: PopupMenuButton<ConferenceItem>(
              onSelected: (ConferenceItem result) {
                switch (result) {
                  case ConferenceItem.AddMember:
                    Fluttertoast.showToast(msg: '添加成员');
                    break;
                  case ConferenceItem.LockConference:
                    Fluttertoast.showToast(msg: '锁定会议');
                    break;
                  case ConferenceItem.ModifyLayout:
                    Fluttertoast.showToast(msg: '修改布局');
                    break;
                  case ConferenceItem.TurnoffAll:
                    Fluttertoast.showToast(msg: '挂断所有');
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                //菜单项构造器
                return <PopupMenuEntry<ConferenceItem>>[
                  const PopupMenuItem<ConferenceItem>(
                    //菜单项
                    child: Text('添加成员'), value: ConferenceItem.AddMember,
                  ),
                  const PopupMenuItem<ConferenceItem>(
                    //菜单项
                    child: Text('锁定会议'), value: ConferenceItem.LockConference,
                  ),
                  const PopupMenuItem<ConferenceItem>(
                    //菜单项
                    child: Text('修改布局'), value: ConferenceItem.ModifyLayout,
                  ),
                  const PopupMenuItem<ConferenceItem>(
                    //菜单项
                    child: Text('挂断所有'), value: ConferenceItem.TurnoffAll,
                  ),
                ];
              },
              onCanceled: () {
                Fluttertoast.showToast(msg: 'onCanceled');
              },
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: Text('热度'),
                  value: 'hot',
                ),
                PopupMenuItem<String>(
                  child: Text('最新'),
                  value: 'new',
                )
              ];
            },
            child: Text('abc'),
            tooltip: '长按提示',
            initialValue: 'hot',
            padding: EdgeInsets.all(5),
            onSelected: (String action) {
              switch (action) {
                case 'hot':
                  Fluttertoast.showToast(msg: '热度');
                  break;
                case 'new':
                  Fluttertoast.showToast(msg: '最新');
                  break;
              }
            },
            onCanceled: () {
              Fluttertoast.showToast(msg: 'onCanceled');
            },
            elevation: 10,
          )
        ],
      ),
    );
  }
}

//会控菜单项
enum ConferenceItem { AddMember, LockConference, ModifyLayout, TurnoffAll }
