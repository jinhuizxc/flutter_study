
import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/base_study/http/dio/pages/good_list_page.dart';

/*
 * Dio请求
 */
class DioStudy extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio请求'),
      ),
      body: GoodListPage(),
    );
  }
}
