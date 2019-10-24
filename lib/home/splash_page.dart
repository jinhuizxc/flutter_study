import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/login/login_router.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/utils/image_utils.dart';
import 'package:flutter_study/utils/utils.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flukit/flukit.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _status = 0;
  List<String> _guideList = [
    "app_start_1",
    "app_start_2",
    "app_start_3",
  ];

  StreamSubscription _subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !(_status == 0),
            child: Image.asset(
              Utils.getImgPath("start_page", format: "jpg"),
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Offstage(
            offstage: !(_status == 1),
            child: Swiper(
                autoStart: false,
                circular: false,
                indicator: null,
                children: [
                  // ignore: sdk_version_ui_as_code
                  for (int i = 0, length = _guideList.length; i < length; i++)
                    if (i == length - 1)
                      InkWell(
                        onTap: () {
                          _goLogin();
                        },
                        child: loadAssetImage(
                          _guideList[i],
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    else
                      loadAssetImage(
                        _guideList[i],
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      )
                ]),
          )
        ],
      ),
    );
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 2000)).listen((_) {
    });
  }


  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
  }
}
