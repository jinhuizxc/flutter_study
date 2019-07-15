import 'package:flutter/material.dart';
import 'package:flutter_study/flutter_study/component/ComponentBean.dart';
import 'package:flutter_study/flutter_study/utils/PageUtil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: _buildList());
  }

  Widget _buildList() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10.0),
        itemCount: componentList.length * 2,
        itemBuilder: (context, position) {
          // position.isOdd|
          if (position.isOdd) return Divider(height: 1.0, color: Colors.grey);
          final index = position ~/ 2; // 整除
          return _buildRow(index);
        },
      ),
    );
  }

  Widget _buildRow(int index) {
    ComponentBean bean = componentList[index];

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.white,
        // 横向排列布局
        child: Row(
          children: <Widget>[
            // Expanded组件
            Expanded(
              // 纵向排列
                child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      bean.name,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        bean.description,
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        maxLines: 2,
                      )),
                ),
              ],
            )),
            Container(
              child: Image.asset(bean.illustration,
                  width: 120.0, height: 80.0, fit: BoxFit.cover),
            )
          ],
        ),
      ),
      onTap: () {
        // 跳转
        PageUtil().pushTo(context, bean.targetWidget);
      },
    );
  }
}
