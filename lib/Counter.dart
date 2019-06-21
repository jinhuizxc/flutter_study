
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => new _CounterState();

}

class _CounterState extends State<Counter> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: $_counter'),

      ],
    );
  }



  void _increment() {
    setState(() {
      _counter++;
    });
  }
}