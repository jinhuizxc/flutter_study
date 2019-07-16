import 'package:flutter/material.dart';

/*
 * Flutter - 页面间跳转操作
 * https://www.jianshu.com/p/60340f7ea6f8
 */
class RouterTests extends StatefulWidget {
  @override
  _RouterTestState createState() => _RouterTestState();
}

class _RouterTestState extends State<RouterTests> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'navigate demo',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to 2nd page'),
            onPressed: () {
              print('This is first page');
              // 执行想要的操作..........
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('${this} hashCode=${this.hashCode}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Go back"),
            onPressed: () {
              print('This is 2nd page');
              // 执行操作........
              Navigator.pop(context);
            }),
      ),
    );
  }
}
