import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/utils/utils.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/common/user.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/user_info_model.dart';
import 'package:flutter_study/wanandroid/event/login_event.dart';
import 'package:flutter_study/wanandroid/event/theme_change_event.dart';
import 'package:flutter_study/wanandroid/res/styles.dart';
import 'package:flutter_study/wanandroid/ui/collect_screen.dart';
import 'package:flutter_study/wanandroid/ui/login_screen.dart';
import 'package:flutter_study/wanandroid/ui/rank_screen.dart';
import 'package:flutter_study/wanandroid/ui/score_screen.dart';
import 'package:flutter_study/wanandroid/ui/setting_screen.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/sp_util.dart';
import 'package:flutter_study/wanandroid/utils/theme_util.dart';
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Image.asset(
                        Utils.getImgPath('ic_rank'),
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      ),
                      onTap: (){
                        RouteUtil.push(context, RankScreen());
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage(Utils.getImgPath('ic_default_avatar')),
                    radius: 40.0,
                  ),
                  Gaps.vGap15,
                  InkWell(
                    child: Text(username,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      if (!isLogin) {
                        RouteUtil.push(context, LoginScreen());
                      }
                    },
                  ),
                  Gaps.vGap15,
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
              onTap: () {
                if (isLogin) {
                  // TODO 跳转分享
//                  RouteUtil.push(context, ShareScreen());
                } else {
                  ToastUtil.show(msg: "请先登录~");
                  RouteUtil.push(context, LoginScreen());
                }
              },
            ),
            ListTile(
              title: Text(
                'TODO',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              leading: Image.asset(
                Utils.getImgPath('ic_todo'),
                width: 24,
                height: 24,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                if (isLogin) {
                  ToastUtil.show(msg: "todo~");
//                  RouteUtil.push(context, TodoScreen());
                } else {
                  ToastUtil.show(msg: "请先登录~");
                  RouteUtil.push(context, LoginScreen());
                }
              },
            ),
            ListTile(
              title: Text(
                '夜间模式',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              leading: Icon(
                Icons.brightness_2,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                setState(() {
                  changeTheme();
                });
              },
            ),
            ListTile(
              title: Text(
                '系统设置',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              leading: Icon(Icons.settings,
                  size: 24, color: Theme.of(context).primaryColor),
              onTap: () {
                RouteUtil.push(context, SettingScreen());
              },
            ),
            Offstage(
              offstage: !isLogin,
              child: ListTile(
                title: Text(
                  '退出登录',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(Icons.power_settings_new,
                    size: 24, color: Theme.of(context).primaryColor),
                onTap: () {
                  _logout(context);
                },
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

  /// 改变主题
  void changeTheme() {
    ThemeUtils.dark = !ThemeUtils.dark;
    SPUtil.putBool(Constants.DARK_KEY, ThemeUtils.dark);
    Application.eventBus.fire(new ThemeChangeEvent());
  }

  void _logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text('确定退出登录吗？'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child:
                        new Text('取消', style: TextStyle(color: Colors.cyan))),
                new FlatButton(
                    onPressed: () => {
                          apiService.logout((BaseModel model) {
                            Navigator.of(context).pop(true);
                            if (model.errorCode == Constants.STATUS_SUCCESS) {
                              // 清空用户信息
                              User.singleton.clearUserInfo();
                              setState(() {
                                isLogin = false;
                                username = '去登录';
                                level = "--";
                                rank = "--";
                                myScore = '';
                              });
                              ToastUtil.show(msg: '已退出登录');
                            } else {
                              ToastUtil.show(msg: model.errorMsg);
                            }
                          }, (DioError error) {
                            print(error.response);
                          })
                        },
                    child:
                        new Text('确定', style: TextStyle(color: Colors.cyan))),
              ],
            ));
  }
}
