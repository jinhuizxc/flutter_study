import 'package:flutter/material.dart';

/*
 * 次级页面
 *
 */
class DetailScreen extends StatelessWidget {

  String title;


  DetailScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
