import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * 侧滑页面
 *
 * UserAccountsDrawerHeader:
 * accountName: 名字
 * accountEmail: 邮箱
 * currentAccountPicture: 头像
 * 
 * CircleAvatar: 圆角头像控件
 */
class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var itemTitles = ['title1', 'title2', 'title3'];
  var itemIcons = [Icons.brightness_6, Icons.title, Icons.message];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'jinhuizxc',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              '1004260403@qq.com',
              maxLines: 2,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/cat.jpeg'),
              backgroundColor: Colors.redAccent,
            ),
            margin: EdgeInsets.zero,
          ),

          // 下面的页面显示
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: itemTitles.length,
                  itemBuilder: (BuildContext context, int index) {
            return _listItem(context, index);
          }))
        ],
      ),
    );
  }

  // 设置item子项
  Widget _listItem(BuildContext context, int index) {
    return Container(
      child: ListTile(
        title: Text(itemTitles[index]),
        leading: Icon(itemIcons[index]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Fluttertoast.showToast(msg: '点击了${itemTitles[index]}');
        },
      ),
    );
  }
}
