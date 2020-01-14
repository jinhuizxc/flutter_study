import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/collection_model.dart';
import 'package:flutter_study/wanandroid/ui/base_widget.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/item_collect_list.dart';
import 'package:flutter_study/wanandroid/widgets/refresh_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 我的收藏页面
class CollectScreen extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> attachState() {
    return CollectScreenState();
  }
}

class CollectScreenState extends BaseWidgetState<CollectScreen> {
  List<CollectionBean> _collectList = new List();

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  /// 是否显示悬浮按钮
  bool _isShowFAB = false;

  /// 页码，从0开始
  int _page = 0;

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  AppBar attachAppBar() {
    // TODO: implement attachAppBar
    return AppBar(
      elevation: 0.4,
      title: Text('收藏'),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showLoading().then((value) {
      getCollectionList();
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
        onRefresh: getCollectionList,
        onLoading: getMoreCollectionList,
        controller: _refreshController,
        child: ListView.builder(
          itemCount: _collectList.length,
          itemBuilder: _itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
        ),
      ),
      floatingActionButton: !_isShowFAB
          ? null
          : FloatingActionButton(
              heroTag: 'collect',
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                /// 回到顶部时要执行的动画
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 2000), curve: Curves.ease);
              }),
    );
  }

  // 对应的item项
  Widget _itemView(BuildContext context, int index) {
    CollectionBean item = _collectList[index];
    return ItemCollectList(
      item: item,
      onCollectCallBack: (isCollect) {
        if (isCollect) {
          setState(() {
            _collectList.removeAt(index); // 如果被收藏，移除该项
          });
        }
      },
    );
  }

  /// 获取收藏文章列表
  Future getCollectionList() async {
    _page = 0;
    apiService.getCollectionList((CollectionModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          showContent();
          _refreshController.refreshCompleted(resetFooterState: true);
          setState(() {
            _collectList.clear();
            _collectList.addAll(model.data.datas);
          });
        } else {
          showEmpty();
        }
      } else {
        ToastUtil.show(msg: model.errorMsg);
        showError();
      }
    }, (DioError error) {
      showError();
    }, _page);
  }

  /// 获取更多文章列表
  Future<Null> getMoreCollectionList() async {
    _page++;
    apiService.getCollectionList((CollectionModel model) {
      if (model.errorCode == Constants.STATUS_SUCCESS) {
        if (model.data.datas.length > 0) {
          _refreshController.loadComplete();
          setState(() {
            _collectList.addAll(model.data.datas);
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
      getCollectionList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
    _scrollController.dispose();
  }

}
