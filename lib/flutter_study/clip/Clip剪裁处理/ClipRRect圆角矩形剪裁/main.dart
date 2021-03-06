import 'package:flutter/material.dart';


class ClipRRectSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipRRect圆角矩形剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          //圆角矩形
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                //圆角弧度，值越大弧度越大
                Radius.circular(30.0)),
            //固定大小
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              child: Image.asset(
                "assets/images/8.jpeg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
    );
  }
}
