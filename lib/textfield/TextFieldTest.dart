import 'package:flutter/material.dart';

/*
 * TextEditingController 处理文本输入
 */
class TextFieldWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '处理文本输入',
      home: ExampleWidget(),
    );
  }

}
class ExampleWidget extends StatefulWidget {

//  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => new _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('处理文本输入'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new TextField(
            controller: _controller,
            decoration: new InputDecoration(
              hintText: '请输入些什么吧',
              helperText: '手动输入内容',
              helperStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 20.0,
              )
            ),
          ),
          new RaisedButton(
            onPressed: () {
              // 显示dialog
              showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('你的输入内容是: '),
                  content: new Text(_controller.text),
                ),
              );
            },
            child: new Text('DONE'),
          ),
        ],
      )
    );
  }
}
