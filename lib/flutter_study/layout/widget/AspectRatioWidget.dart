import 'package:flutter/material.dart';

/*
 * AspectRatioWidget
 *
 * Flutter之AspectRatio组件
 * https://www.jianshu.com/p/ded159986636
 *
 * AspectRatio:
 *   const AspectRatio({
    Key key,
    @required this.aspectRatio,
    Widget child,
  }) : assert(aspectRatio != null),
       super(key: key, child: child);

 */
class AspectRatioWidget extends StatelessWidget {
  String title;

  AspectRatioWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    /*  body: Container(
        height: 200,
//        color: Colors.red[300],
        child: AspectRatio(
          aspectRatio: 1.5,  // 比例可以调整
          child: Container(
            color: Colors.green,
          ),
        ),
      ),*/

        body: Container(
          width: 100.0,
          child: AspectRatio(
            aspectRatio: 2.0 / 3.0,
            child: Container(
              color: Color(0xffff0000),
            ),
          ),
        )


    );
  }
}
