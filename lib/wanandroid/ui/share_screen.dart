import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/base_model.dart';
import 'package:flutter_study/wanandroid/data/model/share_model.dart';
import 'package:flutter_study/wanandroid/event/refresh_share_list_event.dart';
import 'package:flutter_study/wanandroid/ui/base_widget.dart';
import 'package:flutter_study/wanandroid/ui/share_article_screen.dart';
import 'package:flutter_study/wanandroid/utils/route_util.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/item_share_list.dart';
import 'package:flutter_study/wanandroid/widgets/loading_dialog.dart';
import 'package:flutter_study/wanandroid/widgets/refresh_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 我的分享界面
class ShareScreen extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> attachState() {
    return ShareScreenState();
  }
}

class ShareScreenState extends BaseWidgetState<ShareScreen> {
  List<ShareBean> _shareList = new List();

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  /// 是否显示悬浮按钮
  bool _isShowFAB = false;

  /// 页码，从1开始
  int _page = 1;

  /// 滑动删除控制器
  final SlidableController _slidableController = new SlidableController();

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  AppBar attachAppBar() {
    return AppBar(
      elevation: 0.4,
      title: Text('我的分享'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              RouteUtil.push(context, ShareArticleScreen());
            })
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    this.registerRefreshEvent();
  }

  /// 注册刷新列表事件
  void registerRefreshEvent() {
    Application.eventBus.on<RefreshShareEvent>().listen((event) {
      showLoading().then((value) {
        getShareList();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showLoading().then((value) {
      getShareList();
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

  /// 获取分享文章列表
  Future<Null> getShareList() async {
    _page = 1;
    apiService.getShareList((ShareModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        var list = model.data.shareArticles.datas;
        if (list.length > 0) {
          showContent();
          _refreshController.refreshCompleted(resetFooterState: true);
          setState(() {
            _shareList.clear();
            _shareList.addAll(list);
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

  /// 获取更多文章列表
  Future<Null> getMoreShareList() async {
    _page++;
    apiService.getShareList((ShareModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        var list = model.data.shareArticles.datas;
        if (list.length > 0) {
          _refreshController.loadComplete();
          setState(() {
            _shareList.addAll(list);
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

  /// 删除已分享的文章
  Future deleteShareArticle(int id, int index) async {
    _showLoading(context);
    apiService.deleteShareArticle((BaseModel model) {
      _dismissLoading(context);
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        ToastUtil.show(msg: "已删除分享的文章");
        setState(() {
          _shareList.removeAt(index);
        });
      } else {
        ToastUtil.show(msg: model.errorMsg);
      }
    }, (error) {
      _dismissLoading(context);
    }, id);
  }

  /// 显示Loading
  void _showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return new LoadingDialog(
            outsideDismiss: false,
            loadingText: 'loading',
          );
        });
  }

  /// 隐藏Loading
  void _dismissLoading(BuildContext context) {
    Navigator.of(context).pop();
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
        onRefresh: getShareList,
        onLoading: getMoreShareList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _shareList.length,
        ),
      ),
      floatingActionButton: !_isShowFAB
          ? null
          : FloatingActionButton(
              heroTag: "share",
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                /// 回到顶部时要执行的动画
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 2000), curve: Curves.ease);
              },
            ),
    );
    ;
  }

  Widget itemView(BuildContext context, int index) {
    ShareBean item = _shareList[index];
    return ItemShareList(
      item: item,
      slidableController: _slidableController,
      deleteItemCallback: (_id) {
        this.deleteShareArticle(_id, index);
      },
    );
  }


  @override
  void onClickErrorWidget() {
    super.onClickErrorWidget();
    showLoading().then((value) {
      getShareList();
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
