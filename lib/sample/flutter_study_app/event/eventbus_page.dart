import 'package:flutter/material.dart';
import 'package:flutter_study/sample/flutter_study_app/common/events.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * Flutter EventBus消息总线
 * https://www.jianshu.com/p/bc4ed6ca7d79
 *
 * flutter基础-组件通信(父子、兄弟）
 * https://www.jianshu.com/p/25a85c02d586?tdsourcetag=s_pctim_aiomsg
 */

class EventBusPage extends StatefulWidget {
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  TextEditingController _colorController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // 设置左边返回箭头颜色
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'EventBus消息总线',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text("eventbus事件总线输入颜色值修改APP主题色",
                  style: TextStyle(fontSize: 14, color: Color(0xff666666))),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            _getColorInputView(),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            _getBottonView(),
          ],
        ),
      ),
    );
  }

  _getColorInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _colorController,
      decoration: InputDecoration(
        hintText: "输入正确的颜色值,如黑色：#000000",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getBottonView() {
    return RaisedButton(
        child: Text(
          "确定",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.blueAccent, // 背景色
        onPressed: () {
          if (_colorController.text == null || _colorController.text == "") {
            Fluttertoast.showToast(
              msg: "请输入正确的颜色值",
              backgroundColor: Colors.white,
            );
            return;
          }
          print("输入的颜色值为: " + _colorController.text); // I/flutter: 输入的颜色值为: #568958
          // 发送订阅消息去修改颜色
          eventBus.fire(ThemeColorEvent(_colorController.text));
        },
        // 圆角Border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }
}
