import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/user_score_model.dart';
import 'package:flutter_study/wanandroid/ui/base_widget.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/refresh_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 我的积分页面
class ScoreScreen extends BaseWidget {
  String myScore = '----';

  ScoreScreen(this.myScore);

  @override
  BaseWidgetState<BaseWidget> attachState() {
    return ScoreScreenState();
  }
}

class ScoreScreenState extends BaseWidgetState<ScoreScreen> {
  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  /// 是否显示悬浮按钮
  bool _isShowFAB = false;

  /// 页码，从1开始
  int _page = 1;

  List<UserScoreBean> _userScoreList = new List();

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  AppBar attachAppBar() {
    return AppBar(
      title: Text('积分明细'),
      elevation: 0,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              var title = "本站积分规则";
              var url = "https://www.wanandroid.com/blog/show/2653";
              RouteUtil.toWebView(context, title, url);
            })
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showLoading().then((value) {
      getUserScoreList();
    });

    _scrollController.addListener(() {
      /// 滑动到底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // getMoreCollectionList();
      }
      if (_scrollController.offset < 200 && _isShowFAB) {
        setState(() {
          _isShowFAB = false;
        });
      } else if (_scrollController.offset >= 200 && !_isShowFAB) {
        setState(() {
          _isShowFAB = true;
        });
      }
    });
  }

  @override
  Widget attachContentWidget(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        controller: _refreshController,
        onRefresh: getUserScoreList,
        onLoading: getMoreUserScoreList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _userScoreList.length + 1,
        ),
      ),
      floatingActionButton: !_isShowFAB
          ? null
          : FloatingActionButton(
              heroTag: "user_score",
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                /// 回到顶部时要执行的动画
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 2000), curve: Curves.ease);
              },
            ),
    );
  }

  // item
  Widget itemView(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        height: 140.0,
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        child: Text(
          widget.myScore,
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      );
    }

    UserScoreBean item = _userScoreList[index - 1];
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.reason,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      item.desc,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
              Text(
                '+${item.coinCount}',
                style: TextStyle(fontSize: 16.0, color: Colors.cyan),
              )
            ],
          ),
        ),
        Divider(height: 1.0)
      ],
    );
  }

  /// 获取用户积分列表
  Future getUserScoreList() async {
    _page = 1;
    apiService.getUserScoreList((UserScoreModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          showContent();
          _refreshController.refreshCompleted(resetFooterState: true);
          setState(() {
            _userScoreList.clear();
            _userScoreList.addAll(model.data.datas);
          });
        } else {
          showEmpty();
        }
      } else {
        showError();
        ToastUtil.show(msg: model.errorMsg);
      }
    }, (DioError error) {
      showError();
    }, _page);
  }

  /// 获取更多积分列表
  Future getMoreUserScoreList() async {
    _page++;
    apiService.getUserScoreList((UserScoreModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          _refreshController.loadComplete();
          setState(() {
            _userScoreList.addAll(model.data.datas);
          });
        } else {
          _refreshController.loadNoData();
        }
      } else {
        _refreshController.loadFailed();
        ToastUtil.show(msg: model.errorMsg);
      }
    }, (DioError error) {
      _refreshController.loadFailed();
    }, _page);
  }

  @override
  void onClickErrorWidget() {
    super.onClickErrorWidget();
    showLoading().then((value) {
      getUserScoreList();
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
