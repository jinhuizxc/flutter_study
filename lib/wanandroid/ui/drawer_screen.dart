import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/utils/utils.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/user_info_model.dart';
import 'package:flutter_study/wanandroid/event/login_event.dart';
import 'package:flutter_study/wanandroid/res/styles.dart';
import 'package:flutter_study/wanandroid/ui/collect_screen.dart';
import 'package:flutter_study/wanandroid/ui/login_screen.dart';
import 'package:flutter_study/wanandroid/ui/score_screen.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';

/// 侧滑页面
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with AutomaticKeepAliveClientMixin {
  bool isLogin = false;
  String username = "去登录";
  String level = "--"; // 等级
  String rank = "--"; // 排名
  String myScore = ''; // 我的积分

  @override
  void initState() {
    super.initState();
    this.registerLoginEvent();

    if (null != User.singleton.userName && User.singleton.userName.isNotEmpty) {
      isLogin = true;
      username = User.singleton.userName;
      getUserInfo();
    }
  }

  void registerLoginEvent() {
    Application.eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        isLogin = true;
        username = User.singleton.userName;
        getUserInfo();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 40, 16, 40),
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  Container(),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage(Utils.getImgPath('ic_default_avatar')),
                    radius: 40.0,
                  ),
                  InkWell(
                    child: Text(username,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      if (!isLogin) {
                        RouteUtil.push(context, LoginScreen());
                      }
                    },
                  ),
                  Gaps.vGap5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('等级:',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Text(level,
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Gaps.hGap5,
                      Text('排名:',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Text(
                        rank,
                        style: TextStyle(fontSize: 11, color: Colors.grey[100]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('我的积分',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              leading: Image.asset(
                Utils.getImgPath('ic_score'),
                width: 24,
                height: 24,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Text(
                myScore,
                style: TextStyle(color: Colors.grey[500]),
              ),
              onTap: () {
                if (isLogin) {
                  RouteUtil.push(context, ScoreScreen(myScore));
                } else {
                  ToastUtil.show(msg: '请先登录~');
                  RouteUtil.push(context, LoginScreen());
                }
              },
            ),
            ListTile(
              title: Text(
                '我的收藏',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                if (isLogin) {
                  RouteUtil.push(context, CollectScreen());
                } else {
                  ToastUtil.show(msg: '请先登录~');
                }
              },
              leading: Icon(
                Icons.favorite_border,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text(
                '我的分享',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              leading: Image.asset(
                Utils.getImgPath('ic_share'),
                width: 24,
                height: 24,
                color: Theme.of(context).primaryColor,
              ),
              onTap: (){
                if(isLogin){
                  // TODO 跳转分享
//                  RouteUtil.push(context, ShareScreen());
                }else{
                  ToastUtil.show(msg: "请先登录~");
                  RouteUtil.push(context, LoginScreen());
                }
              },
            ),
            ListTile(
              title: Text('TODO'),
            ),
            ListTile(
              title: Text('夜间模式'),
            ),
            ListTile(
              title: Text('系统设置'),
            ),
            Offstage(
              offstage: !isLogin,
              child: ListTile(
                title: Text('退出登录'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return true;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  /// 获取用户信息
  Future getUserInfo() async {
    apiService.getUserInfo((UserInfoModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        setState(() {
          level = (model.data.coinCount ~/ 100 + 1).toString();
          rank = model.data.rank.toString();
          myScore = model.data.coinCount.toString();
        });
      }
    }, (DioError error) {
      print("获取用户信息失败: " + error.message);
    });
  }
}
