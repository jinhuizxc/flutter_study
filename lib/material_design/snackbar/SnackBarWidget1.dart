import 'package:flutter/material.dart';

/*
 * SnackBar
 *
 *  Scaffold.of() called with a context that does not contain a Scaffold.
 *
 */
class SnackBarWidget1 extends StatelessWidget {

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SnackBar组件'),
        leading: BackButton(),
      ),
      body: DemoTest(),
    );
  }
}


/*
 * 修改为以下即可，把Scafford独立出widget出来。
 */
class DemoTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          final snackbar = new SnackBar(
//            content: Text('这是一个snackBar!'),
            content: Icon(Icons.wallpaper),
            backgroundColor: Colors.black,
            action: SnackBarAction(
              label: '撤销',
              onPressed: () {},
              textColor: Colors.white,
            ),
            duration: Duration(
              minutes: 1,
            ),
          );
          // 显示snackbar
          Scaffold.of(context).showSnackBar(snackbar);
//          _scaffoldkey.currentState.showSnackBar(snackbar);
        },
        child: Text('点击: 显示屏幕底部消息'),
      ),
    );
  }
}
