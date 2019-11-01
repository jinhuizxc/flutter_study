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

/*
 * 父 widget 管理 widget 的 state
 *
 *  ParentWidget 为 TapboxB 管理状态.
 * ParentWidgetState 类：

    为 TapboxB 管理 _active 状态.

    实现 _handleTapboxChanged()，当盒子被点击时调用的方法.

    当状态改变时，调用 setState() 更新 UI.

TapboxB 类：

    继承 StatelessWidget 类，因为所有状态都由其父 widget 处理.

    Extends StatelessWidget because all state is handled by its parent.

    当检测到点击时，它会通知父 widget.
 */

class ParentWidgetTest extends StatefulWidget {
  @override
  _ParentWidgetTestState createState() => _ParentWidgetTestState();
}

class _ParentWidgetTestState extends State<ParentWidgetTest> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('父widget管理widget的state'),
      ),
      body: Center(
        child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
