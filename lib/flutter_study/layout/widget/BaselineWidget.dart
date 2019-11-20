import 'package:flutter/material.dart';

/*
 * Baseline基准线布局
 */
class BaselineWidget extends StatelessWidget {
  String title;

  BaselineWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        //水平等间距排列子组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //设置基准线
          Baseline(
            baseline: 80.0,
            //对齐字符底部水平线
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'AaBbCc',
              style: TextStyle(
                fontSize: 18.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              width: 40.0,
              height: 40.0,
              color: Colors.green,
            ),
          ),
          Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'DdEeFf',
              style: TextStyle(
                  fontSize: 26.0, textBaseline: TextBaseline.alphabetic),
            ),
          )
        ],
      ),
    );
  }
}
