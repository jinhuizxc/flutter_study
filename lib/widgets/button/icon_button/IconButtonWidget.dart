import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图标按钮组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('图标按钮组件示例'),
        ),
        body: Center(
          //添加图标按钮
          child: IconButton(
            icon: Icon(
              Icons.volume_up,
              size: 48.0,
            ),
            //按钮提示
            tooltip: '按下操作',
            //按下事件响应
            onPressed: (){
              print('按钮被点击');
            },
          ),
        ),
      ),
    );
  }
}
