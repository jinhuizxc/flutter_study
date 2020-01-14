import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/common/common.dart';
import 'package:flutter_study/wanandroid/data/api/api_service.dart';
import 'package:flutter_study/wanandroid/data/model/wx_chapters_model.dart';
import 'package:flutter_study/wanandroid/ui/base_widget.dart';
import 'package:flutter_study/wanandroid/ui/wx_article_screen.dart';
import 'package:flutter_study/wanandroid/utils/toast_util.dart';

/// 公众号页面
class WeChatScreen extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> attachState() => _WeChatScreenState();
}

class _WeChatScreenState extends BaseWidgetState<WeChatScreen> with TickerProviderStateMixin{

  TabController _tabController;
  List<WXChaptersBean> _chaptersList = new List();


  @override
  AppBar attachAppBar() {
    return AppBar(title: Text(""));
  }

  @override
  void initState() {
    super.initState();
    setAppBarVisible(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showLoading().then((value) {
      getWXChaptersList();
    });

  }

  @override
  Widget attachContentWidget(BuildContext context) {
    _tabController = new TabController(length: _chaptersList.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Theme.of(context).primaryColor,
            child: TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelStyle: TextStyle(fontSize: 16),
                controller: _tabController,
                isScrollable: true,
                tabs: _chaptersList.map((WXChaptersBean item) {
                  return Tab(text: item.name);
                }).toList()),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: _chaptersList.map((item) {
                  return WXArticleScreen(item.id);
                }).toList()),
          )
        ],
      ),
    );
  }

  Future getWXChaptersList() async {
    apiService.getWXChaptersList((WXChaptersModel wxChaptersModel) {
      if (wxChaptersModel.errorCode == Constants.STATUS_SUCCESS) {
        if (wxChaptersModel.data.length > 0) {
          showContent();
          setState(() {
            _chaptersList.clear();
            _chaptersList.addAll(wxChaptersModel.data);
          });
        } else {
          showEmpty();
        }
      } else {
        showError();
        ToastUtil.show(msg: wxChaptersModel.errorMsg);
      }
    }, (DioError error) {
      showError();
    });
  }

  @override
  void onClickErrorWidget() {
    super.onClickErrorWidget();
    showLoading().then((value) {
      getWXChaptersList();
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


}
