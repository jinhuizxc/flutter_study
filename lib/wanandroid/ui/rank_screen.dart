import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/rank_model.dart';
import 'package:flutter_study/wanandroid/ui/base_widget.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/refresh_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/// 积分排行榜页面
class RankScreen extends BaseWidget{

  @override
  BaseWidgetState<BaseWidget> attachState() {
    // TODO: implement attachState
    return RankScreenState();
  }

}

class RankScreenState extends BaseWidgetState<RankScreen>{

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  /// 页码，从1开始
  int _page = 1;

  List<RankBean> _rankList = new List();

  RefreshController _refreshController =
  new RefreshController(initialRefresh: false);

  @override
  AppBar attachAppBar() {
    return AppBar(
      title: Text("积分排行榜"),
      elevation: 0.4,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showLoading().then((value) {
      getRankList();
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
        onRefresh: getRankList,
        onLoading: getMoreRankList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _rankList.length,
        ),
      ),
    );
  }

  /// 获取积分排行榜列表
  Future getRankList() async {
    _page = 1;
    apiService.getRankList((RankModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          showContent();
          _refreshController.refreshCompleted(resetFooterState: true);
          setState(() {
            _rankList.clear();
            _rankList.addAll(model.data.datas);
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

  /// 获取更多积分排行榜列表
  Future getMoreRankList() async {
    _page++;
    apiService.getRankList((RankModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          _refreshController.loadComplete();
          setState(() {
            _rankList.addAll(model.data.datas);
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
    showLoading().then((value) {
      getRankList();
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  // 积分item
  Widget itemView(BuildContext context, int index) {
    RankBean item = _rankList[index];
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                alignment: Alignment.center,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                ),
              ),
              // 充满布局剩余空间
              Expanded(
                child: Text(item.username, style: TextStyle(fontSize: 16.0)),
              ),
              Text(
                item.coinCount.toString(),
                style: TextStyle(fontSize: 14.0, color: Colors.cyan),
              )
            ],
          ),
        ),
        Divider(height: 1.0)
      ],
    );
  }
}

