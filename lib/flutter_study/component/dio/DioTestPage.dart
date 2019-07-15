import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/component/loading/LoadingComponent.dart';
import 'package:flutter_study/flutter_study/utils/NetUtil.dart';

class DioTestPage extends StatefulWidget {
  @override
  _DioTestPageState createState() => _DioTestPageState();
}

class _DioTestPageState extends State<DioTestPage> {
  String content;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DioTest'),
        leading: BackButton(),
      ),
      body: showContent(),
    );
  }

  Widget showContent() {
//    return LoadingComponent();
    return Text(content);
//    return content == '' ? LoadingComponent() : Text(content);
  }

  // 获取列表
  void _getList() {
    NetUtil.get('https://www.baidu.com/', (response) {
      setState(() {
        content = response.data;
      });
    }, errorCallBack: (errorMsg) {
      setState(() {
        content = errorMsg;
      });
    });
  }
}
