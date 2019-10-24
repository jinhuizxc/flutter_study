import 'package:flutter/material.dart';


class ClipPathSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath路径剪裁示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipPath路径剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: ClipPath(
            clipper: TriangleCliper(),//指定自定义三角形Clipper
            child: SizedBox(
              width: 100.0,
              height:100.0,
              child: Image.asset("assets/images/8.jpeg",fit: BoxFit.fill,),
            ) ,
          ),
        ),
      ),
    );
  }
}

//自定义三角形Clipper,类型为Path
class TriangleCliper extends CustomClipper<Path>{
  //重写获取剪裁范围
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(50.0,50.0);//起始点
    path.lineTo(50.0,10.0);//终止点
    path.lineTo(100.0,50.0);//起始点(50,10),终止点
    path.close();//使这些点构成三角形
    return path;
  }
  //重写是否重新剪裁
  @override
  bool shouldReclip(TriangleCliper oldClipper) {
    return true;
  }
}