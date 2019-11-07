import 'package:flutter/material.dart';

/*
 * BottomNavigationBarWidget学习
 */
class BottomNavigationBarWidgetStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBarWidget组件学习'),
      ),
        body: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage({Key key}) : super(key: key);
}

class _MyHomePageState extends State<MyHomePage> {

  //当前选中项的索引
  int _currentIndex = 1;

  //导航栏按钮选中对应数据
  final _selectOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部应用按钮
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      //中间内容显示区域
      body: Center(
        child: _selectOptions.elementAt(_currentIndex), //居中显示某一个文本
      ),
      //底部导航按钮集
      bottomNavigationBar: BottomNavigationBar(
        //当前选中项的索引
        currentIndex: _currentIndex,
        //选项中项的颜色
        fixedColor: Colors.deepPurple,
        //选择按下处理
        onTap: _onItemTap,
        // 对应的是List<BottomNavigationBarItem> items;
        items: <BottomNavigationBarItem>[
          //底部导航按钮项 包含图标及文本
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('发现'),
          ),
        ],
      ),
    );
  }

  /*
   * 选择按下处理 设置当前索引为index值
   */
  _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
