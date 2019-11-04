import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/*class WidgetTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  @override
  StatelessElement createElement() {

  }

}*/

class WidgetTest extends StatefulWidget {
  // 当要创建新的 `StatefulWidget `的时候，会立即执行 createState，而且只执行一次
  @override
  _WidgetTestState createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> with WidgetsBindingObserver {


  // 在 `StatefulWidget` 第一次创建的时候，` build `方法会在 `didChangeDependencies` 方法之后立即调用，
  // 另外一种会调用` build `方法的场景是，
  // 每当 UI 需要重新渲染的时候， `build` 都会被调用，所以 `build `会被多次调用，然后 返回要渲染的` Widget`。
  @override
  Widget build(BuildContext context) {
    print('--生命周期测试: build--');
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期测试'),
      ),
    );
  }

  // initState 是 StatefulWidget 创建完后调用的第一个方法，而且只执行一次
  @override
  void initState() {
    super.initState();
    print('--生命周期测试: initState--');
//    SchedulerBinding.instance.addPostFrameCallback((_) => {});
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('--生命周期测试: reassemble--');
  }
  @override
  void dispose() {
    super.dispose();
    print('--生命周期测试: dispose--');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('--生命周期测试: deactivate--');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // went to Background
    }
    if (state == AppLifecycleState.resumed) {
      // came back to Foreground
    }
  }

  // didChangeDependencies 方法会在 initState 方法之后立即调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('--生命周期测试: didChangeDependencies--');
  }

  @override
  void didUpdateWidget(WidgetTest oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('--生命周期测试: didUpdateWidget--');
  }

}
