
import 'package:flutter/material.dart';

/*
 * InkWell测试
 *  可点击上方方块查看效果
 */
class InkWellTest extends StatelessWidget {

  static const String _title = 'InkWell测试';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InkWell测试"),
      ),
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {

  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  double sideLength = 50;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: sideLength,
        width: sideLength,
        duration: Duration(seconds: 2),
        curve: Curves.easeIn,
        child: Material(
          color: Colors.yellow,
          child: InkWell(
                onTap: () {
                  setState(() {
                    sideLength == 50 ? sideLength = 100 : sideLength = 50;
                  });
                },
              ),
        ),
      ),
    );
  }
}


