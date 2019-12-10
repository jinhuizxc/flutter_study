import 'package:flutter/material.dart';
import 'package:flutter_study/RandomWords.dart';
import 'package:flutter_study/flutter_study/navigation/NavigatorTest.dart';
import 'package:flutter_study/main.dart';

class BaseApp extends StatelessWidget {

  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('First page'),
        ),
          body: Container(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.of(_context).push(MaterialPageRoute(builder: (context) {
                      return new SecondScreen();
                    }));
                  },
                  child: Text(
                    'First page',
                    style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  ),
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.of(_context)
                        .push(MaterialPageRoute(builder: (_context) {
//                      return new MyApp();  // 跳转myapp
                      return null;
                    }));
                  },
                  child: Text(
                    'text',
                    style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  ),
                )
              ],
            ),
          )
    );
  }
}
