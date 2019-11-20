//
//import 'package:flutter/material.dart';
//
///*
// * Flutter-GridView使用总结
// * https://www.jianshu.com/p/6b6d2a892d4c
// */
//class GridViewSample extends StatelessWidget {
//
//  List<Widget> list = <Widget>[
//    GridViewCountWidget(title: 'GridView之GridView count的使用'),
//    GridViewExtentWidget(title: 'GridView之GridView extent的使用'),
//
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('GridViewSample'),
//      ),
//      body: ListView(
//        children: list.map((widget) {
//          return ListTile(
//            title: Text(widget.toString()),
//            onTap: () {
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context) => widget,
//                ),
//              );
//            },
//          );
//        }).toList(),
//      ),
//    );
//  }
//}
//
