import 'package:flutter/material.dart';

/*
 * TabBar选项卡示例
 */
class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //选项卡的类目
    List<ItemView> items = <ItemView>[
      ItemView(title: '自驾', icon: Icons.directions_car),
      ItemView(title: '自行车', icon: Icons.directions_bike),
      ItemView(title: '轮船', icon: Icons.directions_boat),
      ItemView(title: '公交车', icon: Icons.directions_bus),
      ItemView(title: '火车', icon: Icons.directions_railway),
      ItemView(title: '步行', icon: Icons.directions_walk),
    ];

    return MaterialApp(
      //添加DefaultTabController关联TabBar及TabBarView
      home: DefaultTabController(
          length: items.length, //传入选项卡数量
          child: Scaffold(
            appBar: AppBar(
              title: Text('TabBar选项卡示例'),
              //选项卡按钮
              bottom: TabBar(
                  isScrollable: true, //设置为可以滚动
                  tabs: items.map((ItemView item) {
                    //迭代添加选项卡按钮子项
                    return Tab(
                      text: item.title,
                      icon: Icon(item.icon),
                    );
                  }).toList()),
            ),
            //添加选项卡视图
            body: TabBarView(
                children: items.map((ItemView item) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectedView(item: item),
              );
            }).toList()),
          )),
    );
  }
}

//被选中的视图
class SelectedView extends StatelessWidget {
  //视图数据
  final ItemView item;

  const SelectedView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    //添加卡片组件 展示有质感
    return Card(
      //卡片颜色
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,  //垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center,  //水平方向居中对齐
          children: <Widget>[
            Icon(item.icon, size: 128.0, color: textStyle.color,),
            Text(item.title, style: textStyle,)
          ],
        ),
      ),
    );
  }
}

//视图项数据
class ItemView {
  final String title; // 标题
  final IconData icon; // 图标

  ItemView({this.title, this.icon}); //构造方法 传入标题及图标

}
