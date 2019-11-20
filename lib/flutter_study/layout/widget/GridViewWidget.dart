import 'package:flutter/material.dart';

/*
 * GridView九宫格示例
 *
 * GidView之GridView extent的使用
 * https://www.jiangkang.tech/archives/%E3%80%90Flutter%E3%80%91GridView%E4%B9%8BGridView%20extent%E7%9A%84%E4%BD%BF%E7%94%A8
 *
 *
 */
class GridViewWidget extends StatelessWidget {
  String title;

  GridViewWidget({this.title});

  //使用generate构造图片列表
  List<Container> _buildGridTileList(int count) {
    //index为列表项索引
    return List<Container>.generate(count, (int index) =>Container(
      //根据索引添加图片路径
      child: Image.asset('assets/images/${index + 1}.jpeg'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: buildGrid(),
      ),
    );
  }

  //渲染GridView  y轴为主轴
  // GridView.count 是在交叉轴上创建固定个数的Item，
  // crossAxisCount为必须的属性，表示交叉轴Item的个数；

  // GridView.extent是在交叉轴上创建最大可容纳的Item，maxCrossAxisExtent是必须的属性，
  // 表示交叉轴上Item最大的宽度；
  //如果GridView的主轴是纵轴，横轴是交叉轴（默认情况），
  // 设定交叉轴的宽度为500px，maxCrossAxisExtent 为 150，由于3x150 < 500 < 5 x150，
  // 因此Item有4个，500px/ 4 = 125px,因此Item的宽度为125px（不考虑Item之间的间距）。

  Widget buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150, //次轴的宽度
      padding: const EdgeInsets.all(4.0),  //上下左右内边距
      crossAxisSpacing: 4.0, //次轴元素间距
      mainAxisSpacing: 4.0, //主轴元素间距
      children: _buildGridTileList(9), //添加9个元素,);
    );
  }
}
