import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * ListView基本布局
 */
class ListViewWidget extends StatelessWidget {
  String title;

  ListViewWidget({this.title});

  @override
  Widget build(BuildContext context) {
    //列表项集合
    List<Widget> list = <Widget>[
      //列表项
      ListTile(
        //标题
        title: Text('我是title1', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        //子标题
        subtitle: Text('我是subtitle1, 可点击哦'),
        //左侧图标
        leading: Icon(Icons.fastfood, color: Colors.orange,),
        onTap: (){
          Fluttertoast.showToast(msg: '我是subtitle1');
        },
      ),
      ListTile(
        title: Text('我是title2', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('我是subtitle2'),
        leading: Icon(
          Icons.airplay,
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('我是title3', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('我是subtitle3'),
        leading: Icon(
          Icons.local_hospital,
          color: Colors.green,
        ),
      ),
      ListTile(
        title: Text('我是title4', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('我是subtitle4'),
        leading: Icon(
          Icons.computer,
          color: Colors.deepPurple,
        ),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          //列表视图组件
          child: ListView(
            children: list,
          ),
        ));
  }
}
