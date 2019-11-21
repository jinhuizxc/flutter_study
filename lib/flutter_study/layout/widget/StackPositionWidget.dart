import 'package:flutter/material.dart';

// 层叠定位布局示例
class StackPositionWidget extends StatelessWidget {
  String title;

  StackPositionWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        //添加层叠布局
        child: Stack(
          children: <Widget>[
            //添加网络图片
            Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541655494719&di=6b49d24b5172a34828b9d6506e4bf100&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn11%2F266%2Fw640h426%2F20180813%2Fce56-hhqtawx8254771.jpg'),
            //设置定位布局,
            // 不设置Positioned的this.left,this.top,this.right,this.bottom,
            // 默认显示在图片上一个控件的左上方显示，设置
            Positioned(
//                bottom: 50.0,
//                right: 100.0,
                child: Text(
              'hi flutter',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
                color: Colors.white,
              ),
            )),

            // 右上方位置
            Positioned(
                top: 50.0,
                right: 5.0,
                child: Text(
                  'my world!',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Colors.white,
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
