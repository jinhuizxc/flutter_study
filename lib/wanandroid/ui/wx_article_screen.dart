import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/wx_article_model.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';
import 'package:flutter_study/wanandroid/widgets/item_wechat_list.dart';
import 'package:flutter_study/wanandroid/widgets/refresh_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WXArticleScreen extends StatefulWidget {
  final int id;

  WXArticleScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return new WXArticleScreenState();
  }
}

class WXArticleScreenState extends State<WXArticleScreen>
    with AutomaticKeepAliveClientMixin {

  List<WXArticleBean> _wxArticleList = new List();

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  /// 是否显示悬浮按钮
  bool _isShowFAB = false;
  int _page = 1;

  RefreshController _refreshController =
  new RefreshController(initialRefresh: true);

  Future getWXArticleList() async {
    _page = 1;
    int _id = widget.id;
    apiService.getWXArticleList((WXArticleModel wxArticleModel) {
      if (wxArticleModel.errorCode == Constants.STATUS_SUCCESS) {
        _refreshController.refreshCompleted(resetFooterState: true);
        setState(() {
          _wxArticleList.clear();
          _wxArticleList.addAll(wxArticleModel.data.datas);
        });
      } else {
        ToastUtil.show(msg: wxArticleModel.errorMsg);
      }
    }, (DioError error) {}, _id, _page);
  }

  Future getMoreWXArticleList() async {
    _page++;
    int _id = widget.id;
    apiService.getWXArticleList((WXArticleModel wxArticleModel) {
      if (wxArticleModel.errorCode == Constants.STATUS_SUCCESS) {
        if (wxArticleModel.data.datas.length > 0) {
          _refreshController.loadComplete();
          setState(() {
            _wxArticleList.addAll(wxArticleModel.data.datas);
          });
        } else {
          _refreshController.loadNoData();
        }
      } else {
        _refreshController.loadFailed();
        ToastUtil.show(msg: wxArticleModel.errorMsg);
      }
    }, (DioError error) {
      _refreshController.loadFailed();
    }, _id, _page);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getWXArticleList();

    _scrollController.addListener(() {
      /// 滑动到底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // getMoreWXArticleList();
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
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        controller: _refreshController,
        onRefresh: getWXArticleList,
        onLoading: getMoreWXArticleList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _wxArticleList.length,
        ),
      ),
      floatingActionButton: !_isShowFAB
          ? null
          : FloatingActionButton(
        heroTag: "wechat",
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          /// 回到顶部时要执行的动画
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 2000), curve: Curves.ease);
        },
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    WXArticleBean item = _wxArticleList[index];
    return ItemWeChatList(item: item);
  }
}
