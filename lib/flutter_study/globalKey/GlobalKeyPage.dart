import 'package:flutter/material.dart';

/*
 * GlobalKey学习
 * https://segmentfault.com/a/1190000011276853
 */
class GlobalKeyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GlobalKey学习'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
