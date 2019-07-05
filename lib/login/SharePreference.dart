import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oktoast/oktoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

/*
 *   登录界面, 数据持久化;
 *
 * Flutter数据存储之shared_preferences
 * https://www.jianshu.com/p/735b5684e900
 *
 *  shared_preferences: "^0.4.2"
 *
 * fluttertoast代码示例：
 * Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

 *  伪代码:
 *   save() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(mUserName, _userNameController.value.text.toString());
    }

    Future<String> get() async {
      var userName;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString(mUserName);
      return userName;
    }

    return new Builder(builder: (BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text("SharedPreferences"),
        ),
        body: Center(
          child: new Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10.0),
                      icon: Icon(Icons.perm_identity),
                      labelText: "请输入用户名",
                      helperText: "注册时填写的名字"),
                ),
                RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("存储"),
                    onPressed: () {
                      save();
                      Scaffold.of(context)
                          .showSnackBar(new SnackBar(content: Text("数据存储成功")));
                    }),
                RaisedButton(
                    color: Colors.greenAccent,
                    child: Text("获取"),
                    onPressed: () {
                      Future<String> userName = get();
                      userName.then((String userName) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("数据获取成功：$userName")));
                      });
                    }),
              ],
            );
          }),
        ),
      );
    });
 *
 */

class SharePreference extends StatelessWidget {
  final String mUserName = "userName";
  final String mPassWord = "passWord";
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _passWordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 保存数据
    save() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // TODO 用户信息如何条件判断？
      /* if (_userNameController.value.text.isEmpty) {
        Scaffold.of(context)
            .showSnackBar(new SnackBar(content: Text('用户名不能为空')));
//        Fluttertoast.showToast(msg: '用户名不能为空', toastLength: Toast.LENGTH_SHORT);
        return;
      }
      if (_passWordController.value.text.isEmpty) {
        Scaffold.of(context)
            .showSnackBar(new SnackBar(content: Text('密码不能为空')));
//        Fluttertoast.showToast(msg: '密码不能为空', toastLength: Toast.LENGTH_SHORT);
        return;
      }*/
      prefs.setString(mUserName, _userNameController.value.text.toString());
      prefs.setString(mPassWord, _passWordController.value.text.toString());
    }

    // 获取数据
    Future<String> get() async {
      var userName;
      var password;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString(mUserName);
      password = prefs.getString(mPassWord);
      return "用户名 = " + userName + " 密码 = " + password;
    }

    // Another exception was thrown: Scaffold.of() called with a context that does not contain a Scaffold.

    return new Builder(builder: (BuildContext context) {
        return new Scaffold(
          appBar: AppBar(
            title: Text('SharedPreference'),
          ),
          body: Center(
            child: new Builder(builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  // 文本编辑框
                  TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10.0),
                      icon: Icon(Icons.perm_identity),
                      labelText: '请输入用户名',
                      helperText: '注册时填写的名字',
                    ),
                  ),
                  TextField(
                    controller: _passWordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      labelText: '请输入密码',
                      helperText: '注册时填写的密码',
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      save(); // 保存数据
                      // 显示snackBar
                      Scaffold.of(context)
                          .showSnackBar(new SnackBar(content: Text('数据存储成功')));
                    },
                    color: Colors.blueAccent,
                    child: Text('存储'),
                  ),
                  RaisedButton(
                      color: Colors.greenAccent,
                      child: Text("获取"),
                      onPressed: () {
                        Future<String> string = get();
                        string.then((String str) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('数据获取成功 $str')));
                        });
                      }),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}

// 官方sample
class OfficialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '官方sample',
      home: Scaffold(
        /* appBar: AppBar(
          title: Text('test'),
        ),*/
        body: Center(
          child: RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment Counter'),
          ),
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.'); // I/flutter: Pressed 2 times.
    prefs.setInt('counter', counter);
  }
}
