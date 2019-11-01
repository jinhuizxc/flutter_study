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
 * 混搭管理
 *
 * 对于一些 widget 来说，混搭管理的方法最合适的。在这种情况下，有状态的 widget 自己管理一些状态，同时父 widget 管理其他方面的状态。

在 TapboxC 示例中，点击时，盒子的周围会出现一个深绿色的边框。点击时，边框消失，盒子的颜色改变。TapboxC 将其 _active 状态导出到其父 widget 中，但在内部管理其 _highlight 状态。这个例子有两个状态对象 _ParentWidgetState 和 _TapboxCState。

_ParentWidgetState 对象:

    管理_active 状态。

    实现 _handleTapboxChanged(), 此方法在盒子被点击时调用。

    当点击盒子并且 _active 状态改变时调用 setState() 来更新UI。

_TapboxCState 对象:

    管理 _highlight state。

    GestureDetector 监听所有 tap 事件。当用户点下时，它添加高亮（深绿色边框）；当用户释放时，会移除高亮。

    当按下、抬起、或者取消点击时更新 _highlight 状态，调用 setState() 更新UI。

    当点击时，widget 属性将状态的改变传递给父 widget 并进行合适的操作。
 *
 */

class ParentWidgetTest1 extends StatefulWidget {
  @override
  _ParentWidgetTest1State createState() => _ParentWidgetTest1State();
}

class _ParentWidgetTest1State extends State<ParentWidgetTest1> {
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
        title: Text('混搭管理'),
      ),
      body: Center(
        child: TapboxC(active: _active, onChanged: _handleTapboxChanged),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
