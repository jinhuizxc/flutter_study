import 'package:flutter/material.dart';
import 'package:flutter_study/scaffoldWidget/ScaffoldSample.dart';
/*
 * Container一个拥有绘制、定位、调整大小的 widget。
 * Row在水平方向上排列子widget的列表。
 * Column在垂直方向上排列子widget的列表。 
 *
 */
//  child: Container(
//        margin: const EdgeInsets.all(10.0),
//        color: Colors.amber[600],
//        width: 48.0,
//        height: 48.0,
//      ),
//    );
abstract class BaseWidget1 extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
//        appBar: AppBar(
//          title: Text('基础组件'), // used by the OS task switcher
//        ),
        // 示例1
//        body: new Container(
//          // Container属性
//          margin: const EdgeInsets.all(10.0),
//          color: Colors.amber[600],
//          width: 48.0,
//          height: 48.0,
//        ),

        // 示例2
//        body: new Container(
//          constraints: BoxConstraints.expand(
//            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
//          ),
//          padding: const EdgeInsets.all(8.0),
//          color: Colors.blue[600],
//          alignment: Alignment.center,
//          child: Text('Hello World',
//              style: Theme.of(context)
//                  .textTheme
//                  .display1
//                  .copyWith(color: Colors.white)),
//          transform: Matrix4.rotationZ(0.1),
//        ),

        // 示例3  设置Row
//          body: _Row()),
//          body: _Column(),  // 设置Column
//        body: _MyButtonWidget(),   // ButtonWidget;
//        body: _ScaffoldWidget(),   // ButtonWidget;
        body: BasicAppBarSample(),   // ButtonWidget;
      ),
    );
  }

  Widget _Row() {
    return new Container(
        // 样例1
//          child: Row(
//            children: <Widget>[
//              Expanded(
//                child: Text('Deliver features faster',
//                    textAlign: TextAlign.center),
//              ),
//              Expanded(
//                child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
//              ),
//              Expanded(
//                child: FittedBox(
////                  fit: BoxFit.contain, // otherwise the logo will be tiny
//                  child: const FlutterLogo(),
//                ),
//              ),
//            ],
//          ),
        // 样例2
//          child: Row(
//            children: <Widget>[
//              const FlutterLogo(),
//              const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
//              const Icon(Icons.sentiment_very_satisfied),
//            ],
//          ),
        // 样例3
        child: Row(
      children: <Widget>[
        const FlutterLogo(),
        const Expanded(
          child: Text(
              'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
        ),
        const Icon(Icons.sentiment_very_satisfied),
      ],
    ));
  }

  Widget _Column() {
    // 样例1
//    return Column(
//      children: <Widget>[
//        Text('Deliver features faster'),
//        Text('Craft beautiful UIs'),
//        new Icon(Icons.info),
//        Expanded(
//          child: FittedBox(
//            fit: BoxFit.contain, // otherwise the logo will be tiny
//            child: const FlutterLogo(),
//          ),
//        ),
//      ],
//    );
    // 样例2

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
        Text('We will fight up close, seize the moment and stay in it'),
        Text('It’s either that or meet the business end of a bayonet'),
        Text('The code word is ‘Rochambeau,’ dig me?'),
        Text('Rochambeau!',
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
      ],
    );
  }


}



// _ScaffoldWidget
class _ScaffoldWidget extends StatefulWidget {
  _ScaffoldWidget({Key key}) : super(key: key);

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<_ScaffoldWidget> {
  int _count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: Text('You have pressed the button $_count times.'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          alignment: Alignment.bottomRight,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      // endTop 右上 startTop 左上 endFloat右下 centerFloat 居中 centerDocked: centerFloat的下方一点位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  // endFloat右边位置
    );
  }
}


class _MyButtonWidget extends StatelessWidget {
  _MyButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const RaisedButton(
            onPressed: null,
            child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
//            padding: EdgeInsets.all(10.0),
          ),
          const SizedBox(height: 30),

          RaisedButton(
            onPressed: () {},
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Gradient Button', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
