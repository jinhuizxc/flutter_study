/*
 * widget 管理自己的状态
 * 有时，widget 在内部管理其状态是最好的。例如，当 ListView 的内容超过渲染框时，
 * ListView 自动滚动。大多数使用 ListView 的开发人员不想管理 ListView 的滚动行为，
 * 因此 ListView 本身管理其滚动偏移量。
 *
 * _TapboxAState 类:
 * 管理 TapboxA 的状态.
 * 定义布尔值 _active 确定盒子的当前颜色.
 * 定义 _handleTap() 函数，该函数在点击该盒子时更新 _active,并调用 setState() 更新 UI。
 * 实现 widget 的所有交互式行为.
 */
import 'package:flutter/material.dart';

class TapboxATest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget管理自己的状态'),
      ),
      body: Center(
        child: TapboxA(),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
            child: Text(
              _active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            )),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
}
