import 'package:flutter/material.dart';

// Stack布局示例Alignment
class StackAligmentWidget extends StatelessWidget {
  String title;

  StackAligmentWidget({this.title});

  @override
  Widget build(BuildContext context) {
    // 创建层叠布局stack
    var stack = Stack(
      //子组件左上角对齐
      alignment: Alignment.center,
      children: <Widget>[
        //底部添加一个头像
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/1.jpeg'),
        ),
        /*Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541655494719&di=6b49d24b5172a34828b9d6506e4bf100&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn11%2F266%2Fw640h426%2F20180813%2Fce56-hhqtawx8254771.jpg'),*/
        //上面加一个容器 容器里再放一个文本
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
          child: Text(
            '我是测试文本',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: stack,
      ),
    );
  }
}
