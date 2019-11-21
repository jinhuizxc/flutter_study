import 'package:flutter/material.dart';

// Table表格布局示例
class TableWidget extends StatelessWidget {
  String title;

  TableWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        //添加表格
        child: Table(
          //设置表格有多少列,并且指定列宽
          columnWidths: const <int, TableColumnWidth>{
            //指定索引及固定列宽
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(40.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(80.0),
          },
          //设置表格边框样式
          border: TableBorder.all(
              color: Colors.black38, width: 2.0, style: BorderStyle.solid),
          children: const <TableRow>[
            //添加第一行数据
            TableRow(
              children: <Widget>[
                Text('姓名', textAlign: TextAlign.center,),
                Text('性别', textAlign: TextAlign.center,),
                Text('年龄', textAlign: TextAlign.center, ),
                Text('身高', textAlign: TextAlign.center),
              ],
            ),
            //添加第二行数据
            TableRow(
              children: <Widget>[
                Text('张三'),
                Text('男'),
                Text('26'),
                Text('172'),
              ],
            ),
            //添加第三行数据
            TableRow(
              children: <Widget>[
                Text('李四'),
                Text('男'),
                Text('28'),
                Text('178'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
